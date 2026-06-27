Pod::Spec.new do |s|
  s.name         = "MLKitAbseilStubs"
  s.version      = "14.0.0"
  s.summary      = "Abseil Stubs for arm64 simulator"
  s.homepage     = "https://developers.google.com/ml-kit/guides"
  s.license      = { :type => "Copyright", :text => "Copyright 2025 Google LLC" }
  s.author       = { "Google" => "cocoapods@google.com" }
  s.platform     = :ios, "15.5"
  s.source       = { :http => "https://github.com/iwater/google-mlkit-ios-arm64-simulator/releases/download/v1.0.1/MLKitCommon.xcframework.zip" }
  s.source_files = "AbseilStubs.mm"
  s.libraries    = ["c++"]
end
