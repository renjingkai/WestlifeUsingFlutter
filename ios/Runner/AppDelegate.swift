import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   
    let vc = window.rootViewController as! FlutterBinaryMessenger
    
    let channel = FlutterMethodChannel(name: "renjingkaiMethodChannel",binaryMessenger: vc);

    channel.setMethodCallHandler { (call, result) in
        let methodName = call.method;
        if (methodName == "FlutterCallSwiftMethod"){
          
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
             
                 result("SwiftGiveFlutterResponse");
            }
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
