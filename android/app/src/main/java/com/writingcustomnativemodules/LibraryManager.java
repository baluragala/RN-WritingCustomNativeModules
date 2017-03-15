package com.writingcustomnativemodules;

import android.app.Activity;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

/**
 * Created by moksha on 15/03/17.
 */

public class LibraryManager extends ReactContextBaseJavaModule implements ActivityEventListener {

    public LibraryManager(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addActivityEventListener(this);
    }

    // see what happens when returns null
    @Override
    public String getName() {
        return "LibraryManager";
    }


    @ReactMethod
    public void selectImage() {
        Activity currentActivity = getCurrentActivity();
        Intent libraryIntent = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
        currentActivity.startActivityForResult(libraryIntent, 1);
    }

    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        String filePath = data != null ? data.getDataString() : "";
    }

    @Override
    public void onNewIntent(Intent intent) {

    }
}
