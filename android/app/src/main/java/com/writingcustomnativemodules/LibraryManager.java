package com.writingcustomnativemodules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

/**
 * Created by moksha on 15/03/17.
 */

public class LibraryManager extends ReactContextBaseJavaModule {

    public LibraryManager(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    // see what happens when returns null
    @Override
    public String getName() {
        return "LibraryManager";
    }
}
