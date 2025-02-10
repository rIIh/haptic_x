import Flutter
import UIKit
import CoreHaptics

extension FlutterError: @retroactive Error {}

@available(iOS 13.0, *)
let kHapticManager = HapticEngineManager()

public class HapticXPlugin: NSObject, FlutterPlugin, HapticXApi {
    private var patterns: [String: String] = [:]
    
    override init() {
        super.init()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : HapticXApi & NSObjectProtocol = HapticXPlugin.init()
        HapticXApiSetup.setUp(binaryMessenger: messenger, api: api);
    }
    
    func preload(id: String, data: String) throws {
        patterns[id] = data
    }
    
    func play(id: String) throws {
        guard let data = patterns[id] else {
            throw FlutterError(code: "missing_data", message: "pattern was not preloaded", details: nil)
        }
        
        if #available(iOS 13.0, *) {
            kHapticManager.prepareHaptics()
            kHapticManager.startVibrationIOS(data: data)
        } else {
            throw FlutterError(code: "unsupported_operation", message: "minimum required OS version is 13.0", details: nil)
        }
    }
    
    func release(id: String) throws {
        patterns.removeValue(forKey: id)
    }
    
}
