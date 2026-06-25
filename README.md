# Google ML Kit Patched Specs (for iOS arm64 Simulator)

This is a private CocoaPods Spec repository containing patched podspecs for **Google ML Kit** and its dependencies. 

It is designed to solve the compilation and linking issues encountered on Apple Silicon Macs (M1/M2/M3/M4) when targeting the **iOS arm64 Simulator**.

---

## 📌 Background & How it works

Google ML Kit's prebuilt frameworks for iOS historically lack the `arm64-iphonesimulator` slice (only containing `x86_64` for simulator and `arm64` for physical devices). 

This repository works alongside the [google-mlkit-ios-arm64-simulator](https://github.com/iwater/google-mlkit-ios-arm64-simulator) project to:
1. Extract the `arm64` physical device slice from the official library.
2. Modify the Mach-O binary's `LC_BUILD_VERSION` command, changing its platform flag from `2` (`PLATFORM_IOS` - device) to `7` (`PLATFORM_IOSSIMULATOR` - simulator).
3. Re-package the patched slice with the original `x86_64` slice to form a unified `.xcframework`.
4. Host the patched `.xcframework` binaries in GitHub Releases and route standard podspecs here to fetch the simulator-compatible binaries.

---

## 🚀 How to Use in Your Project

### 1. Add Spec Source to Your `Podfile`
Add this spec repository at the very top of your project's `Podfile`, alongside the official CocoaPods spec source:

```ruby
# 1. Your private specs for simulator-compatible Google ML Kit
source 'https://github.com/iwater/google-mlkit-ios-arm64-simulator-specs.git' # Replace with your actual Specs repo URL
# 2. Official CocoaPods Specs (as fallback)
source 'https://cdn.cocoapods.org/'

platform :ios, '15.5'
```

### 2. Add dependencies
Simply declare the ML Kit dependencies as usual in your targets:

```ruby
target 'YourApp' do
  # CocoaPods will automatically pull the patched versions from your private source
  pod 'react-native-nitro-text-recognition', :path => '../modules/react-native-nitro-text-recognition'
end
```

### ⚠️ 3. Add CocoaPods Swift Include Patch (Required)
CocoaPods does not automatically add custom `vendored_frameworks` Swift header search paths for static libraries in transitive dependencies. You **MUST** add this `post_install` hook to your `Podfile` to prevent compilation errors (like `No such module 'MLKitTextRecognition'`):

```ruby
post_install do |installer|
  # Fix deployment target and architecture exclusions
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.5'
      config.build_settings.delete 'EXCLUDED_ARCHS[sdk=iphonesimulator*]'
    end
  end

  # Patch Swift include paths for vendored frameworks
  podfile_dir = File.dirname(installer.podfile.defined_in_file)
  prebuilt_base = "#{podfile_dir}/Pods-Prebuilt"
  FileUtils.rm_rf(prebuilt_base)

  xcframeworks = %w[MLKitCommon MLImage MLKitVision MLKitTextRecognitionCommon MLKitTextRecognition MLKitTextRecognitionChinese MLKitTextRecognitionDevanagari MLKitTextRecognitionJapanese MLKitTextRecognitionKorean]

  xcframeworks.each do |fw_name|
    xcframework_path = "#{podfile_dir}/LocalPods/#{fw_name}.xcframework"
    next unless File.exist?(xcframework_path)
    sim_slice = Dir.glob("#{xcframework_path}/ios-*simulator*").first
    next unless sim_slice
    framework_in_slice = Dir.glob("#{sim_slice}/#{fw_name}.framework").first
    next unless framework_in_slice
    target_dir = "#{prebuilt_base}/#{fw_name}"
    FileUtils.mkdir_p(target_dir)
    FileUtils.cp_r(framework_in_slice, "#{target_dir}/#{fw_name}.framework")
  end

  xcconfigs_to_patch = Dir.glob("#{installer.sandbox.root}/Target Support Files/Pods-#{File.basename(installer.podfile.defined_in_file, '.*')}/#{File.basename(installer.podfile.defined_in_file, '.*')}.*.xcconfig")

  xcconfigs_to_patch.each do |xcconfig_path|
    lines = File.readlines(xcconfig_path)
    ldflags_parts = []
    fw_search_parts = []
    swift_search_parts = []
    lines.each do |line|
      if line.start_with?("OTHER_LDFLAGS")
        ldflags_parts << line.split("=", 2).last.strip
      elsif line.start_with?("FRAMEWORK_SEARCH_PATHS")
        fw_search_parts << line.split("=", 2).last.strip
      elsif line.start_with?("SWIFT_INCLUDE_PATHS")
        swift_search_parts << line.split("=", 2).last.strip
      end
    end
    xcframeworks.each do |fw_name|
      prebuilt_dir = "#{prebuilt_base}/#{fw_name}"
      next unless File.exist?("#{prebuilt_dir}/#{fw_name}.framework")
      ldflags_parts << "-framework #{fw_name} -F\"#{prebuilt_dir}\""
      fw_search_parts << "\"#{prebuilt_dir}\""
      swift_search_parts << "\"#{prebuilt_dir}\""
    end
    new_lines = lines.reject { |l| l.start_with?("OTHER_LDFLAGS", "FRAMEWORK_SEARCH_PATHS", "SWIFT_INCLUDE_PATHS") }
    new_lines << "OTHER_LDFLAGS = #{ldflags_parts.join(" ")}\n" if ldflags_parts.any?
    new_lines << "FRAMEWORK_SEARCH_PATHS = #{fw_search_parts.join(" ")}\n" if fw_search_parts.any?
    new_lines << "SWIFT_INCLUDE_PATHS = #{swift_search_parts.join(" ")}\n" if swift_search_parts.any?
    File.write(xcconfig_path, new_lines.join)
  end
end
```

---

## ⚖️ Rights & Copyright

Google ML Kit binaries and models are copyright Google LLC and are distributed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0). 

The platform patches (Mach-O header modification) applied to these libraries do not alter their functionality, and are provided solely for platform compatibility under the terms of the Apache 2.0 license.
