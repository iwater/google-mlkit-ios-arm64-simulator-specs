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
end
