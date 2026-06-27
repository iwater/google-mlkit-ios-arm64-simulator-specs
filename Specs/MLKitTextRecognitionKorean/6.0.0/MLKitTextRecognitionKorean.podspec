Pod::Spec.new do |s|
  s.name         = "MLKitTextRecognitionKorean"
  s.version      = "6.0.0"
  s.summary      = "MLKitTextRecognitionKorean - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.1/MLKitTextRecognitionKorean.xcframework.zip" }
  s.vendored_frameworks = "MLKitTextRecognitionKorean.xcframework"
  s.resource_bundles = { "KoreanOCRResources" => ["Resources/KoreanOCRResources/**"] }
  s.frameworks = ["Accelerate", "AVFoundation", "CoreGraphics", "CoreImage", "CoreMedia", "CoreVideo", "Foundation", "UIKit"]
  s.libraries  = ["c++"]
  s.dependency 'MLKitCommon', '14.0.0'
  s.dependency 'MLKitTextRecognitionCommon', '6.0.0'
  s.dependency 'MLKitVision', '10.0.0'
end
