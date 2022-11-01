import Capacitor
import Foundation
import os.log

private let LocalNetwork = LocalNetworkAuthorization()

/// Please read the Capacitor iOS Plugin Development Guide
/// here: https://capacitorjs.com/docs/plugins/ios
@objc(PermissionsCheckerPlugin)
public class PermissionsCheckerPlugin: CAPPlugin {

  @objc func checkPermission(_ call: CAPPluginCall) {
    print("Check Permission Called")
    func callback(response: Bool) {
      print("requestPermission callback: \(response)")

      call.resolve([
        "status": response
      ])
      return
    }
    LocalNetwork.checkAuthorization(completion: callback)
  }

  @objc func requestPermission(_ call: CAPPluginCall) {
    print("Request Permission Called")
    func callback(response: Bool) {
      print("requestPermission callback: \(response)")
      call.resolve([
        "status": response
      ])
      return
    }
    LocalNetwork.requestAuthorization(completion: callback)

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
