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

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    private let localNetwork = LocalNetworkAuthorization()

    @objc func checkPermission(_ call: CAPPluginCall) {
        os_log("Check Permission Called")
        
        func testFunction(x: Bool) {
            os_log(x)
            return
        }

        localNetwork.requestAuthorization(completion: testFunction)


        let permission = call.getString("permission") ?? ""
        var status = permission
        // logic to get local network perm
        call.resolve([
            "status": status
        ])
    }

    @objc func requestPermission(_ call: CAPPluginCall) {
        os_log("Request Permission Called")
        let permission = call.getString("permission") ?? ""
        var status = permission

        // logic to get local network perm
        call.resolve([
            "status": status
        ])
    }
}
