import Foundation
import Network

/// Uses bonjour networking to relialby check if user has granted local network access
/// How to use:
/// Add LocalNetworkAuthorization class to your project
/// Open .plist file and add "_bonjour._tcp", "_lnp._tcp.", as a values under "Bonjour services"
/// Call requestAuthorization() to trigger the prompt or get the authorization status if it already been approved/denied
/// about the author: https://stackoverflow.com/a/67758105/705761

// What is the is code doing:
// This code creates 2 new methods a checkPermission and a requestPermission. on
// IOS there is no API to interact with the local network permission to check its state.
// to get around this we use a bonjour service to get the local network permission request to show
// to the end user. Then we listen to the event to infer what happened.
// One work around we had to implement https://developer.apple.com/forums/thread/666431
// First update in NWBrowser.stateUpdateHandler is always .ready
// Adding a debounce gets around the issue if .ready firing to soon.
// This is also less of an issue because when the app fires up for the first time the mDNS plugin will cause the 
// local network permission prompt to appear. When we get to the setup flow we are only going to need to check if its been set or not.
public class LocalNetworkAuthorization: NSObject {
  private var browser: NWBrowser?
  private var netService: NetService?
  private var completion: ((Bool) -> Void)?

  let debouncer = Debouncer(timeInterval: 5)

  public func requestAuthorization() async -> Bool {
    return await withCheckedContinuation { continuation in
      requestAuthorization { result in
        continuation.resume(returning: result)
      }
    }
  }

  private func requestAuthorization(completion: @escaping (Bool) -> Void) {
    self.completion = completion

    // Create parameters, and allow browsing over peer-to-peer link.
    let parameters = NWParameters()
    parameters.includePeerToPeer = true

    // Browse for a custom service type.
    let browser = NWBrowser(for: .bonjour(type: "_bonjour._tcp", domain: nil), using: parameters)
    self.browser = browser
    browser.stateUpdateHandler = { newState in
      self.debouncer.renewInterval()
      self.debouncer.handler = {
        switch newState {
          case .waiting(let error):
            self.reset()
            // Local network has been denied event false up
            self.completion?(false)
          case .ready:
            self.completion?(true)
          default:
            self.reset()
          }
       }
    }

    self.netService = NetService(
      domain: "local.", type: "_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
    self.netService?.delegate = self

    self.browser?.start(queue: .main)
    self.netService?.publish()

  }

  private func reset() {
    self.browser?.cancel()
    self.browser = nil
    self.netService?.stop()
    self.netService = nil
  }
}

extension LocalNetworkAuthorization: NetServiceDelegate {
  public func netServiceDidPublish(_ sender: NetService) {
    self.reset()
    completion?(true)
  }
}
