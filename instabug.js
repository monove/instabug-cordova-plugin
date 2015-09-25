var exec = require('cordova/exec'),
    InstabugPhoneGap = {

        init: function(config) {
            exec(function(winParam) {},
                function(error) {},
                "InstabugPhoneGap",
                "init", [config]);

        },

        invoke: function() {
            exec(function(winParam) {},
                function(error) {},
                "InstabugPhoneGap",
                "invoke", []);

        },

        invokeBugReporter: function() {
            exec(function(winParam) {},
                function(error) {},
                "InstabugPhoneGap",
                "invokeBugReporter", []);
        },

        invokeFeedbackSender: function() {
            exec(function(winParam) {},
                function(error) {},
                "InstabugPhoneGap",
                "invokeFeedbackSender", []);
        }
    }

module.exports = InstabugPhoneGap;
