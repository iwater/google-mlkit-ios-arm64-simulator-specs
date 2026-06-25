Pod::Spec.new do |s|
  s.name         = "MLKitTextRecognitionJapanese"
  s.version      = "6.0.0"
  s.summary      = "MLKitTextRecognitionJapanese - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.0/MLKitTextRecognitionJapanese.xcframework.zip" }
  s.vendored_frameworks = "MLKitTextRecognitionJapanese.xcframework"
  s.resource_bundles = { "JapaneseOCRResources" => ["Resources/JapaneseOCRResources/**"] }
  s.frameworks = ["Accelerate", "AVFoundation", "CoreGraphics", "CoreImage", "CoreMedia", "CoreVideo", "Foundation", "UIKit"]
  s.libraries  = ["c++"]
end
