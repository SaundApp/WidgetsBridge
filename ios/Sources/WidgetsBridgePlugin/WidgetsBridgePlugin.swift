import Foundation
import Capacitor
import WidgetKit

@objc(WidgetsBridgePlugin)
public class WidgetsBridgePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "WidgetsBridgePlugin"
    public let jsName = "WidgetsBridge"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "setItem", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "reloadTimeline", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "reloadAllTimelines", returnType: CAPPluginReturnPromise)
    ]

    @objc func setItem(_ call: CAPPluginCall) {
        let key = call.getString("key") ?? ""
        let group = call.getString("group") ?? ""
        let value = call.getString("value") ?? ""

        if let userDefaults = UserDefaults.init(suiteName: group) {
            userDefaults.set(value, forKey: key)
            call.resolve()
            return
        }

        call.reject("Failed to set item")
    }

    @objc func reloadTimeline(_ call: CAPPluginCall) {
        let kind = call.getString("kind") ?? ""

        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: kind)
            call.resolve()
        } else {
            call.unavailable("WidgetCenter is only available on iOS 14.0 or newer")
        }
    }

    @objc func reloadAllTimelines(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
            call.resolve()
        } else {
            call.unavailable("WidgetCenter is only available on iOS 14.0 or newer")
        }
    }
}
