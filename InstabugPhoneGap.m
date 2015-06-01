#import "InstabugPhoneGap.h"
#import <Instabug/Instabug.h>
#import <Cordova/CDV.h>

    @implementation InstabugPhoneGap

    - (void)init:(CDVInvokedUrlCommand*)command{
        NSMutableDictionary* options = [command.arguments objectAtIndex:0];
        NSString* appToken = [options objectForKey:@"iosToken"];
        [Instabug startWithToken:appToken captureSource:IBGCaptureSourceUIKit invocationEvent:IBGInvocationEventShake];

        UIColor* headerColor = [self colorFromHexString: [options objectForKey:@"barBackground"]];
        UIColor* headerForegroundColor = [self colorFromHexString: [options objectForKey:@"barForeground"]];

        [Instabug setHeaderColor:headerColor];
        [Instabug setHeaderFontColor:headerForegroundColor];
        [Instabug setButtonsColor:headerForegroundColor];
        [Instabug setButtonsFontColor:headerColor];

        id emailEnabled = [options objectForKey:@"emailEnabled"];
        id emailRequired = [options objectForKey:@"emailRequired"];
        id showTutorial = [options objectForKey:@"showTutorial"];
        [Instabug setWillShowEmailField: emailEnabled ? [emailEnabled boolValue] : true];
        [Instabug setEmailIsRequired: emailRequired ? [emailRequired boolValue] : true];
        [Instabug setWillShowTutorialAlert: showTutorial ? [showTutorial boolValue] : true];

        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Initialization successful"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

    - (void)invoke:(CDVInvokedUrlCommand*)command{
        [Instabug invoke];

        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

    - (void)invokeBugReporter:(CDVInvokedUrlCommand*)command{
        [Instabug invokeBugReporter];

        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

    - (void)invokeFeedbackSender:(CDVInvokedUrlCommand*)command{
        [Instabug invokeFeedbackSender];

        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

    // Assumes input like "#00FF00" (#RRGGBB).
    - (UIColor *)colorFromHexString:(NSString *)hexString {
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:hexString];
        [scanner setScanLocation:1]; // bypass '#' character
        [scanner scanHexInt:&rgbValue];
        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    }   

    @end
