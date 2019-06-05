package com.nixi.flutterpro;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity  extends FlutterActivity {
  private String channel = "com.nixi.boo.main.channel";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), channel)
            .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("jump_chat_page")) {
                    startActivity(new Intent(MainActivity.this,ChatActivity.class));
                    result.success(1);
                } else if (methodCall.method.equals("jump_account_info_page")) {
                    startActivity(new Intent(MainActivity.this,AccountInfoActivity.class));
                    result.success(1);
                }
              }
            });
  }
}
