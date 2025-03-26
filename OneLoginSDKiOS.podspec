
Pod::Spec.new do |spec|

  spec.name         = "OneLoginSDKiOS"
  spec.version      = "1.0.0"
  spec.summary      = "OneLoginSDKiOS empowers developers to create dynamic, engaging, and secure experiences."
  spec.description  = 'OneLoginSDKiOS is a robust and flexible solution designed to help developers effortlessly integrate Multi Factor authentication into their applications. It simplifies the process, ensuring timely and effective communication with your users.'
  spec.homepage     = "https://developers.onelogin.com/api-docs/2/getting-started/dev-overview"
  spec.license      = 'MIT'
  spec.author       = { "Will Munslow" => "will.munslow@oneidentity.com" }
  spec.platform     = :ios, "14.0"
  spec.source       = { :git => "https://github.com/onelogin/onelogin-ios-sdk.git", :tag => spec.version.to_s }
  spec.vendored_frameworks  = "OneLoginSDKiOS/OneLoginSDKiOS.xcframework"

  spec.dependency 'Alamofire', '5.4.1'
  spec.dependency 'RxSwift', '~> 5.0'
  spec.dependency 'RxCocoa', '~> 5.0'
  spec.swift_versions = '5.0'
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }


end

