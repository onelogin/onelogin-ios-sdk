# OneLogin iOS SDK

## Getting Started

### Requirements
- iOS 16.2+
- Xcode 14.2+ (Swift 5.7.2+)

### Installation

#### Swift Package Manager

In Xcode, choose **File > Add Package Dependencies…**, enter `https://github.com/onelogin/onelogin-ios-sdk.git`, and add the `OneLoginSDKiOS` library to your app target.

In a `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/onelogin/onelogin-ios-sdk.git", from: "1.0.1"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "OneLoginSDKiOS", package: "onelogin-ios-sdk")]
    ),
]
```

The package brings in Alamofire and RxSwift 5.1.3, which the SDK's API uses.

#### CocoaPods

CocoaPods Trunk becomes read-only on December 2, 2026, so new releases will be published through Swift Package Manager only. Version 1.0.0 remains available:

1. Add the following line to your `Podfile`:
   ```ruby
   pod 'OneLoginSDKiOS', '~> 1.0'
   ```
2. Run `pod install` to install the dependency.


### Configure the SDK

Onelogin SDK needs the Client ID, Secret and Domain of the OneLogin portal to
communicate with OneLoginSDK. You can find these details in the settings 
page of your OneLogin portal. 

To initialize the SDK, provide your client credentials and subdomain:

```swift
let config = OneLoginSdkConfig(credential: ("<CLIENT_ID>", "<CLIENT_SECRET>"), subDomain: "<Domain>")
OneLoginSDK.shared.intializeSdk(config)
```

### Generate Token

To generate a token, use the following code:

```swift
OneLoginSDK.shared.genrateToken { [weak self] success, tokenDetail, error in
    // Handle success or error
}
```

### Revoke Token

To revoke a token, call:

```swift
OneLoginSDK.shared.revokeToken { [weak self] success, status, error in
    // Handle success or error
}
```

### Rate Limit

To check the rate limit:

```swift
OneLoginSDK.shared.getRateLimit { [weak self] success, rateLimit, error in
    // Handle success or error
}
```

### Additional Endpoints

The SDK provides many more endpoints to support your Multi-Factor Authentication (MFA) needs. Some examples include:

- Users related methods available you can create/update/delete. While getting single user detail or list is also supported
- Factors related methods available. Enroll, Verify , Activate, Temp MFA and many more operation can be perfomed on factor(s).


### Example App 

[OneLoginSDK's Example App](https://github.com/onelogin/onelogin-ios-sdk-example)

---

## Support Policy

This policy defines the extent of support for Xcode, Swift, and platform version (iOS) in the **OneLoginSDKiOS**.

### Xcode
The only supported versions of Xcode are those that are currently required to submit apps to the App Store. Once a version of Xcode becomes unsupported, removing support for it in the SDK will not be considered a breaking change and will be handled in a minor release.

### Swift
The minimum supported Swift minor version will correspond to the one released with the oldest-supported version of Xcode. Once a specific Swift minor version becomes unsupported, removing support for it in the SDK will not be considered a breaking change and will be handled in a minor release.

### Platforms
Once a platform version becomes unsupported, removing support for it in the SDK will not be considered a breaking change and will be handled in a minor release.

For example:
- iOS 14 will no longer be supported once iOS 18 is released, and support for iOS 14 will be dropped in a minor release.

---
