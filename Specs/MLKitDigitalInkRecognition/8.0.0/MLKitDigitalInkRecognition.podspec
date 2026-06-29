Pod::Spec.new do |s|
  s.name         = "MLKitDigitalInkRecognition"
  s.version      = "8.0.0"
  s.summary      = "MLKitDigitalInkRecognition - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.1/MLKitDigitalInkRecognition.xcframework.zip" }
  s.vendored_frameworks = "MLKitDigitalInkRecognition.xcframework"
  s.resource_bundles = { "MLKitDigitalInkRecognition_resource" => ["Resources/MLKitDigitalInkRecognition_resource/**"] }
  s.frameworks = ["Foundation", "Network"]
  s.libraries  = ["c++", "z"]
  s.dependency 'MLKitCommon', '14.0.0'
  s.dependency 'MLKitMDD', '10.0.0'
  s.dependency 'SSZipArchive', '>= 2.5.5', '< 3.0'
end
