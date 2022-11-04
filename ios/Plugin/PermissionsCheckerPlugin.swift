import Capacitor
import Foundation
import os.log


/// Please read the Capacitor iOS Plugin Development Guide
/// here: https://capacitorjs.com/docs/plugins/ios
@objc(PermissionsCheckerPlugin)
public class PermissionsCheckerPlugin: CAPPlugin {

  @objc func checkPermission(_ call: CAPPluginCall) {
    Task {
      let LocalNetwork = LocalNetworkAuthorization()
      let callback = await LocalNetwork.requestAuthorization() 
      call.resolve([
        "local-network": callback ? "granted": "denied"
      ])
    }

  }

  @objc func requestPermission(_ call: CAPPluginCall) {
    Task {
      let LocalNetwork = LocalNetworkAuthorization()
      let callback = await LocalNetwork.requestAuthorization() 
      call.resolve([
        "local-network": callback ? "granted": "denied"
      ])
  }

  @objc func openSettings(_ call: CAPPluginCall) {
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
