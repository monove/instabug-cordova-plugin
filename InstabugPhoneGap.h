#import <Cordova/CDV.h>

    @interface InstabugPhoneGap : CDVPlugin

    - (void)init:(CDVInvokedUrlCommand*)command;
    - (void)invoke:(CDVInvokedUrlCommand*)command;
    - (void)invokeBugReporter:(CDVInvokedUrlCommand*)command;
    - (void)invokeFeedbackSender:(CDVInvokedUrlCommand*)command;

    - (UIColor *)colorFromHexString:(NSString *)hexString;

    @end
