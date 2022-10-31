import Foundation
import Capacitor
import os.log
 
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(PermissionsCheckerPlugin)
public class PermissionsCheckerPlugin: CAPPlugin {
    private let implementation = PermissionsChecker()


    @objc func checkPermission(_ call: CAPPluginCall) {
        os_log("Check Permission Called")
    }  

    private let LocalNetwork = LocalNetworkAuthorization()

    @objc func requestPermission(_ call: CAPPluginCall) {
        os_log("Request Permission Called")
        Task {
            let response = await LocalNetwork.requestAuthorization()
            call.resolve([
                "status": response
            ])
        }
    }
}
