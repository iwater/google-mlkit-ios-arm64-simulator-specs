Pod::Spec.new do |s|
  s.name         = "MLKitCommon"
  s.version      = "14.0.0"
  s.summary      = "MLKitCommon - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.1/MLKitCommon.xcframework.zip" }
  s.vendored_frameworks = "MLKitCommon.xcframework"
  s.frameworks = ["Foundation", "LocalAuthentication"]
  s.libraries  = ["c++", "sqlite3", "z"]
  s.dependency 'GTMSessionFetcher/Core', '>= 3.3.2', '< 4.0'
  s.dependency 'GoogleDataTransport', '~> 10.0'
  s.dependency 'GoogleToolboxForMac/Logger', '>= 4.2.1', '< 5.0'
  s.dependency 'GoogleToolboxForMac/NSData+zlib', '>= 4.2.1', '< 5.0'
  s.dependency 'GoogleUtilities/Logger', '~> 8.0'
  s.dependency 'GoogleUtilities/UserDefaults', '~> 8.0'
end
