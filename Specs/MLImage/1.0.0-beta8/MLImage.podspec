Pod::Spec.new do |s|
  s.name         = "MLImage"
  s.version      = "1.0.0-beta8"
  s.summary      = "MLImage - patched for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.swift_version = "5.7"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.0/MLImage.xcframework.zip" }
  s.vendored_frameworks = "MLImage.xcframework"
  s.frameworks = ["CoreGraphics", "CoreMedia", "CoreVideo", "Foundation", "UIKit"]
end
