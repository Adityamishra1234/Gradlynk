package com.downtownengineers.gradlynk

import android.content.Intent
import android.net.Uri
import java.io.File
import android.os.Bundle
import android.os.Environment
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.devio.flutter.splashscreen.SplashScreen


class MainActivity : FlutterActivity() {
private var  downloadChannel = "methodChannel.download";

    override fun onCreate(savedInstanceState: Bundle?) {
        SplashScreen.show(this, true) // here
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
   MethodChannel(flutterEngine.dartExecutor.binaryMessenger, downloadChannel).setMethodCallHandler {
           call, result ->
       if(call.method == "getLocalPath" ){
           val hashMap = call.arguments as HashMap<*,*> //Get the arguments as a HashMap

           val path = hashMap["path"]
           val imgFile = File(path.toString())
           print(path);

            val intent = Intent();

            intent.setAction(Intent.ACTION_VIEW)
            intent.setDataAndType( Uri.parse( imgFile.absolutePath ) , "image/*")


           startActivity(intent)
//           val data = "getDataFromNative()"



           // Send the result back to Flutter
           result.success(path);
       }else{
           result.notImplemented()
       }

          // This method is invoked on the main thread.
          // TODO
        }
      }

    
}