#import "InstabugPhoneGap.h"
#import <Instabug/Instabug.h>
#import <Cordova/CDV.h>

    @implementation InstabugPhoneGap

    - (void)init:(CDVInvokedUrlCommand*)command{
        NSMutableDictionary* options = [command.arguments objectAtIndex:0];
        
        NSString* appToken = [options objectForKey:@"iosToken"];
        NSString* appLocale = [options objectForKey:@"appLocale"];
        NSString* bugHeaderText = [options objectForKey:@"bugHeaderText"];
        NSString* userData = [options objectForKey:@"userData"];
        NSString* feedbackHeaderText = [options objectForKey:@"feedbackHeaderText"];

        if(bugHeaderText != nil) {
            [Instabug setBugHeaderText:bugHeaderText];
        }
        if(userData != nil) {
            [Instabug setUserData:userData];
        }
        if(feedbackHeaderText != nil) {
            [Instabug setFeedbackHeaderText:feedbackHeaderText];
        }
        
        if(appLocale != nil) {
            IBGLocale lang = IBGLocaleEnglish;
            
            if ([appLocale  isEqual: @"IBGLocaleArabic"]) {
                lang = IBGLocaleArabic;
            } else if ([appLocale  isEqual: @"IBGLocaleChineseSimplified"]) {
                lang = IBGLocaleChineseSimplified;
            } else if ([appLocale  isEqual: @"IBGLocaleChineseTraditional"]) {
                lang = IBGLocaleChineseTraditional;
            } else if ([appLocale  isEqual: @"IBGLocaleEnglish"]) {
                lang = IBGLocaleEnglish;
            } else if ([appLocale  isEqual: @"IBGLocaleFinnish"]) {
                lang = IBGLocaleFinnish;
            } else if ([appLocale  isEqual: @"IBGLocaleFrench"]) {
                lang = IBGLocaleFrench;
            } else if ([appLocale  isEqual: @"IBGLocaleGerman"]) {
                lang = IBGLocaleGerman;
            } else if ([appLocale  isEqual: @"IBGLocaleItalian"]) {
                lang = IBGLocaleItalian;
            } else if ([appLocale  isEqual: @"IBGLocaleJapanese"]) {
                lang = IBGLocaleJapanese;
            } else if ([appLocale  isEqual: @"IBGLocaleKorean"]) {
                lang = IBGLocaleKorean;
            } else if ([appLocale  isEqual: @"IBGLocalePolish"]) {
                lang = IBGLocalePolish;
            } else if ([appLocale  isEqual: @"IBGLocalePortuguese"]) {
                lang = IBGLocalePortuguese;
            } else if ([appLocale  isEqual: @"IBGLocalePortugueseBrazil"]) {
                lang = IBGLocalePortugueseBrazil;
            } else if ([appLocale  isEqual: @"IBGLocaleRussian"]) {
                lang = IBGLocaleRussian;
            } else if ([appLocale  isEqual: @"IBGLocaleSlovenian"]) {
                lang = IBGLocaleSlovenian;
            } else if ([appLocale  isEqual: @"IBGLocaleSpanish"]) {
                lang = IBGLocaleSpanish;
            } else if ([appLocale  isEqual: @"IBGLocaleSwedish"]) {
                lang = IBGLocaleSwedish;
            } else if ([appLocale  isEqual: @"IBGLocaleTurkish"]) {
                lang = IBGLocaleSwedish;
            }
            
            [Instabug setLocale:lang];
        }
        
        [Instabug startWithToken:appToken captureSource:IBGCaptureSourceUIKit invocationEvent:IBGInvocationEventShake];

        UIColor* headerColor = [self colorFromHexString: [options objectForKey:@"barBackground"]];
        [Instabug setHeaderColor:headerColor];
        [Instabug setButtonsFontColor:headerColor];
        
        UIColor* headerForegroundColor = [self colorFromHexString: [options objectForKey:@"barForeground"]];
        [Instabug setHeaderFontColor:headerForegroundColor];
        
        NSString* buttonsColorStr = [options objectForKey:@"buttonsColor"];
        if(buttonsColorStr != nil) {
            UIColor* buttonsColor = [self colorFromHexString: buttonsColorStr];
            [Instabug setButtonsColor:buttonsColor];
            UIColor* buttonsFontColor = [self colorFromHexString: [options objectForKey:@"buttonsFontColor"]];
            [Instabug setButtonsFontColor:buttonsFontColor];
        }

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
