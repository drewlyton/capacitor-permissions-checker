import Capacitor
import Foundation
import os.log


/// Please read the Capacitor iOS Plugin Development Guide
/// here: https://capacitorjs.com/docs/plugins/ios
@objc(PermissionsCheckerPlugin)
public class PermissionsCheckerPlugin: CAPPlugin {

  @objc func checkPermission(_ call: CAPPluginCall) {
    print("CheckPermission() Called")
    Task {
      let LocalNetwork = LocalNetworkAuthorization()
      let callback = await LocalNetwork.requestAuthorization() 
      call.resolve([
        "status": callback
      ])
    }

  }

  @objc func requestPermission(_ call: CAPPluginCall) {
    print("RequestPermission() Called")
    Task {
      let LocalNetwork = LocalNetworkAuthorization()
      let callback = await LocalNetwork.requestAuthorization() 
      call.resolve([
        "status": callback
      ])
    }
  }

  @objc func openSettings(_ call: CAPPluginCall) {
    print("Open Settings called")
    DispatchQueue.main.async(execute: {
      if let url = URL.init(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
          call.resolve([
              "success": true
          ])
      } else {
          call.resolve([
              "success": false
          ])
      }
    })
  }
}
