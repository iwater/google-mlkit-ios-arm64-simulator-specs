Pod::Spec.new do |s|
  s.name         = "MLKitVision"
  s.version      = "10.0.0"
  s.summary      = "MLKitVision - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.1/MLKitVision.xcframework.zip" }
  s.vendored_frameworks = "MLKitVision.xcframework"
  s.frameworks = ["Accelerate", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "Foundation", "UIKit"]
  s.dependency 'GTMSessionFetcher/Core', '>= 3.3.2', '< 4.0'
  s.dependency 'GoogleToolboxForMac/Logger', '>= 4.2.1', '< 5.0'
  s.dependency 'GoogleToolboxForMac/NSData+zlib', '>= 4.2.1', '< 5.0'
  s.dependency 'MLImage', '1.0.0-beta8'
  s.dependency 'MLKitCommon', '14.0.0'
end
