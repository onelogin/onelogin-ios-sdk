# OneLogin iOS SDK

## Getting Started

### Requirements
- iOS 14.0+ / macOS 11.0+
- Xcode 14.x
- Swift 5.0+

### Installation

#### Using CocoaPods
1. Add the following line to your `Podfile`:
   ```ruby
   pod 'OneLoginSDKiOS', '~> 0.0.5'
   ```
2. Run `pod install` to install the dependency.

Or 

#### Using CocoaPods with Onelogin source

1. Add the following to the top of your `Podfile` to specify the source:

   ```ruby
   source 'https://github.com/CocoaPods/Specs.git'
   source 'https://github.com/onelogin/onelogin-ios-sdk.git'
   ```

2. Then, add the OneLogin SDK to your `Podfile`:

   ```ruby
   pod 'OneLoginSDKiOS', '~> 0.0.5'
   ```

3. Run `pod install` to install the dependency.


### Configure the SDK

To initialize the SDK, provide your client credentials and subdomain:

```swift
let config = OneLoginSdkConfig(credential: ("<CLIENT_ID>", "<CLIENT_SECRET>"), subDomain: "<Domain>")
OneLoginSDK.shared.initializeSdk(config)
```

### Generate Token

To generate a token, use the following code:

```swift
OneLoginSDK.shared.generateToken { [weak self] success, tokenDetail, error in
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


---
