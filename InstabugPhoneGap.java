package com.instabug.phonegap.android;

import com.instabug.library.Instabug;
import com.instabug.library.activity.InstabugAnnotationActivity;
import org.apache.cordova.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.graphics.Color;
public class InstabugPhoneGap extends CordovaPlugin {

    CordovaInterface mCordova;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        mCordova = cordova;
    }

    //{"emailEnabled":false, "showTutorial":true, "showIntroDialog":true, "barBackground" : "#FF0000", "barForeground": "#FFFFFF"}
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException{
        if("init".equals(action)) {
            JSONObject configJson = args.optJSONObject(0);
            if(configJson == null) {
                configJson = new JSONObject();
            }
            int barBackground = Color.parseColor(configJson.getString("barBackground"));
            int barForeground = Color.parseColor(configJson.getString("barForeground"));
            String bugHeaderText = configJson.getString("bugHeaderText");
            Instabug.initialize(mCordova.getActivity().getApplication(), configJson.getString("androidToken"))
                    .setAnnotationActivityClass(InstabugAnnotationActivity.class)
                    .setInvocationEvent(Instabug.INVOCATION_SHAKE)
                    .setShowIntroDialog(configJson.optBoolean("showIntroDialog", true))
                    .enableEmailField(configJson.optBoolean("emailEnabled", true), configJson.optBoolean("emailRequired", false))
                    .setSdkStyleColors(0xFFFFFFFF, barBackground, barForeground, barBackground, barForeground)
                    .setShowPostFeedbackToast(true)
                    .setShowTutorial(configJson.optBoolean("showTutorial", true));
            Instabug.getInstance().setActivity(mCordova.getActivity());
            if(bugHeaderText != null && ! bugHeaderText.isEmpty()) {
                Instabug.getInstance().setBugHeaderText(bugHeaderText);
            }
            if(bugHeaderText != null && ! bugHeaderText.isEmpty()) {
                Instabug.getInstance().setBugHeaderText(bugHeaderText);
            }         
            callbackContext.success();
        } else if("invoke".equals(action)) {
            Instabug.getInstance().invokeFeedbackProcess();
        } else if("invokeFeedbackSender".equals(action)) {
            Instabug.getInstance().invokeFeedbackProcess(Instabug.INSTABUG_FEEDBACK_FEEDBACK);
        } else if("invokeBugReporter".equals(action)) {
            Instabug.getInstance().invokeFeedbackProcess(Instabug.INSTABUG_FEEDBACK_BUG);
        }
        return super.execute(action, args, callbackContext);
    }
}
