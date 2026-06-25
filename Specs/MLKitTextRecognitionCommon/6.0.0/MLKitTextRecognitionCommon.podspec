Pod::Spec.new do |s|
  s.name         = "MLKitTextRecognitionCommon"
  s.version      = "6.0.0"
  s.summary      = "MLKitTextRecognitionCommon - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.0/MLKitTextRecognitionCommon.xcframework.zip" }
  s.vendored_frameworks = "MLKitTextRecognitionCommon.xcframework"
  s.frameworks = ["Accelerate", "AVFoundation", "CoreGraphics", "CoreImage", "CoreLocation", "CoreMedia", "CoreVideo", "Foundation", "UIKit"]
  s.libraries  = ["c++"]
end
