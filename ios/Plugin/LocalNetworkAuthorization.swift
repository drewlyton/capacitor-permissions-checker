import Foundation
import Network

/// Uses bonjour networking to relialby check if user has granted local network access
/// How to use:
/// Add LocalNetworkAuthorization class to your project
/// Open .plist file and add "_bonjour._tcp", "_lnp._tcp.", as a values under "Bonjour services"
/// Call requestAuthorization() to trigger the prompt or get the authorization status if it already been approved/denied
/// about the author: https://stackoverflow.com/a/67758105/705761
public class LocalNetworkAuthorization: NSObject {
    private var browser: NWBrowser?
    private var netService: NetService?
    private var completion: ((Bool) -> Void)?
    
    
    public func checkAuthorization(completion: @escaping (Bool) -> Void) {
        self.completion = completion

            // Create parameters, and allow browsing over peer-to-peer link.
        let parameters = NWParameters()
        parameters.includePeerToPeer = true
        
            // Browse for a custom service type.
        let browser = NWBrowser(for: .bonjour(type: "_bonjour._tcp", domain: nil), using: parameters)
        self.browser = browser
        browser.stateUpdateHandler = { newState in
            print("newState: \(newState)")
            switch newState {
                case .failed(let error):
                    print(".failed: \(error)")
                    self.completion?(false)
                case .ready: 
                    self.completion?(true)
                    break
                case .cancelled:
                    self.completion?(false)
                    break
                case let .waiting(error):
                    print("Local network permission has been denied: \(error)")
                    self.completion?(false)
                default:
                    self.completion?(false)
                    break
                }
        }
        
        self.netService = NetService(domain: "local.", type:"_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
        self.netService?.delegate = self
        
        self.browser?.start(queue: .main)
        self.netService?.publish()
    }
    
    
    public func requestAuthorization(completion: @escaping (Bool) -> Void) {
        self.completion = completion

            // Create parameters, and allow browsing over peer-to-peer link.
        let parameters = NWParameters()
        parameters.includePeerToPeer = true
        
            // Browse for a custom service type.
        let browser = NWBrowser(for: .bonjour(type: "_bonjour._tcp", domain: nil), using: parameters)
        self.browser = browser
        browser.stateUpdateHandler = { newState in
            print("newState: \(newState)")
            switch newState {
                case .failed(let error):
                    print(".failed: \(error)")
                    self.completion?(false)
                case .ready: 
                    self.completion?(true)
                    break
                case .cancelled:
                    self.completion?(false)
                    break
                case let .waiting(error):
                    print("Local network permission has been denied: \(error)")
                    self.completion?(false)
                default:
                    self.completion?(false)
                    break
                }
        }
        
        self.netService = NetService(domain: "local.", type:"_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
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

extension LocalNetworkAuthorization : NetServiceDelegate {
    public func netServiceDidPublish(_ sender: NetService) {
        self.reset()
        print("Local network permission has been granted")
        completion?(true)
    }
}