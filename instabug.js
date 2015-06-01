var InstabugPhoneGap = {

	init: function(config) {
	cordova.exec(function(winParam) {},
	                 function(error) {},
	                 "InstabugPhoneGap",
	                 "init",
	                 [config]);

	},

	invoke: function() {
			cordova.exec(function(winParam) {},
	                 function(error) {},
	                 "InstabugPhoneGap",
	                 "invoke",
	                 []);

	},

	invokeBugReporter: function() {
			cordova.exec(function(winParam) {},
	                 function(error) {},
	                 "InstabugPhoneGap",
	                 "invokeBugReporter",
	                 []);
	},

	invokeFeedbackSender: function() {
			cordova.exec(function(winParam) {},
	                 function(error) {},
	                 "InstabugPhoneGap",
	                 "invokeFeedbackSender",
	                 []);
	},



}



/*

instabug_init();


*/