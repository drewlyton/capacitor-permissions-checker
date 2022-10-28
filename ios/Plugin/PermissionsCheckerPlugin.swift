import Foundation
import Capacitor

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

    @objc func query(_ call: CAPPluginCall) {
        let permission = call.getString("permission") ?? ""
        var status = permission

        call.resolve([
            "status": status
        ])
    }
}
