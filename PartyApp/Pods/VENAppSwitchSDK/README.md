## Venmo iOS SDK

[![Build Status](https://travis-ci.org/venmo/venmo-ios-sdk.svg?branch=v2)](https://travis-ci.org/venmo/venmo-ios-sdk)

The Venmo iOS SDK allows you to integrate Venmo into your iOS app.

<img src="/venmo_ios_sdk.gif" width="320px">

### Installation

The easiest way to get started is with [CocoaPods](http://cocoapods.org/). Just add the following line to your Podfile:

```ruby
pod 'venmo-ios-sdk', '~> 1.0.0'
```

### Usage

Using the Venmo iOS SDK is as easy as Venmo-ing a friend!

#### 1. Create your app on Venmo
1. Create a new application on the [Venmo developer site](https://venmo.com/account/settings/developers).
2. Make a note of your new app's `app id` and `app secret`.

#### 2. Configure your Xcode project

1. In your app target's `Info` section, scroll down to `URL Types`.
2. Add a new URL Type with the following properties:

	`Identifier` ==> `venmo<<YOUR_APP_ID>>`

	`URL Schemes` ==> `venmo<<YOUR_APP_ID>>`

For example, if your app ID is `1234`, put `venmo1234`.

![Set URL Types](http://i.imgur.com/8rUXlFB.png)


#### 3. Initialize the Venmo iOS SDK

Add the Venmo SDK header file to your app delegate. You can use the SDK from any of your implementation files by importing this header.

```obj-c
#import <Venmo-iOS-SDK/Venmo.h>
```

Add the following code to initialize the SDK in your app delegate's `application:didFinishLaunchingWithOptions:` method.

```obj-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [Venmo startWithAppId:@"VENMO_APP_ID" secret:@"VENMO_APP_SECRET" name:@"VENMO_APP_NAME"];

    return YES;
}
```

* `VENMO_APP_ID`: ***ID*** from your registered app on the [Venmo developer site](https://venmo.com/account/settings/developers)
* `VENMO_APP_SECRET`: ***Secret*** from your registered app on the [Venmo developer site](https://venmo.com/account/settings/developers)
* `VENMO_APP_NAME`: The app name that will show up in the Venmo app (e.g. "sent via My Supercool App")

To allow the Venmo iOS SDK to handle responses from the Venmo app, add the following to your app delegate's `application:openURL:sourceApplication:annotation:` method:

```obj-c
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([[Venmo sharedInstance] handleOpenURL:url]) {
        return YES;
    }
    return NO;
}
```

#### 4. Send a payment

The Venmo iOS SDK lets you send a payment in two ways:
1. Switching to the Venmo app
    * This method will switch the user to a pre-filled payment screen in the Venmo app. After the user sends or cancels the payment, they'll be switched back to your app.
    * If the user doesn't have the Venmo app installed, the payment will fail with an appropriate error.
2. Using the Venmo API
    * This method won't switch the user to Venmo to make the payment, but _will_ prompt the user to give your app access to their Venmo account. See [5. Requesting permissions](####5.)

Sending payments by switching to the Venmo app has the advantage of allowing your user to bypass the Venmo OAuth flow. If the user doesn't have the Venmo app installed, we recommend using the Venmo API.

```objc
if (![Venmo isVenmoAppInstalled]) {
    [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
}
else {
    [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAppSwitch];
}
```

You can send payments using `sendPaymentTo:amount:note:completionHandler:`. To send a payment request, use `sendRequestTo:amount:note:completionHandler:`.

```obj-c
[[Venmo sharedInstance] sendPaymentTo:self.toTextField.text
                               amount:self.amountTextField.text.floatValue*100
                                 note:self.noteTextField.text
                    completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
    if (success) {
        NSLog(@"Transaction succeeded!");
    }
    else {
        NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
    }
}];
```

### 5. Request permissions

You can request access to a user's Venmo account using `requestPermissions:withCompletionHandler:`. Permissions can be specified with [these scopes](https://developer.venmo.com/docs/authentication#scopes). 

```obj-c
[[Venmo sharedInstance] requestPermissions:@[VENPermissionMakePayments,
                                             VENPermissionAccessProfile]
                     withCompletionHandler:^(BOOL success, NSError *error) {
                         if (success) {
                            // :)
                         }
                         else {
                            // :(
                         }
}];
```

### Sample Application

Included in the `sample` directory is a sample application, **MiniVenmo**, which demonstrates how to log in with Venmo and send payments using the Venmo iOS SDK.

### Contributing

We'd love to see your ideas for improving this library! The best way to contribute is by submitting a pull request – we'll do our best to respond to your patch as soon as possible. You can also [submit an issue](https://github.com/venmo/VENAppSwitchSDK/issues/new) if you find bugs or have any questions. :octocat:

Please make sure to follow our general coding style and add test coverage for new features!
