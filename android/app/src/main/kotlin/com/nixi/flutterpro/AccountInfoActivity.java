package com.nixi.flutterpro;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.WindowManager;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterNativeView;
import io.flutter.view.FlutterView;

public class AccountInfoActivity extends FlutterActivity {

    @Override
    public FlutterView createFlutterView(Context context) {
        WindowManager.LayoutParams matchParent = new WindowManager.LayoutParams(-1, -1);
        FlutterNativeView nativeView = this.createFlutterNativeView();
        FlutterView flutterView = new FlutterView(AccountInfoActivity.this, (AttributeSet) null, nativeView);
        flutterView.setInitialRoute("account_info_route");
        flutterView.setLayoutParams(matchParent);
        this.setContentView(flutterView);
        return flutterView;
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }
}
