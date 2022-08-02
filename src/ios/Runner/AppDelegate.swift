import UIKit
import Flutter

@UIMyapplicationMain
@objc class MyappDelegate: FlutterMyappDelegate {
  override func application(
    _ application: UIMyapplication,
    didFinishLaunchingWithOptions launchOptions: [UIMyapplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
