import Foundation
import UIKit

public extension DebugValue {
    static let appVersion = DebugValue(
        id: "appVersion",
        label: "Version",
        staticValue: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    )
    
    static let appBuildNumber = DebugValue(
        id: "appBuildNumber",
        label: "Build Number",
        staticValue: Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    )
    
    static let appBundleIdentifier = DebugValue(
        id: "bundleId",
        label: "Bundle Identifier",
        staticValue: Bundle.main.bundleIdentifier
    )
    
    static let userLocale = DebugValue(
        id: "locale",
        label: "Locale",
        value: Locale.autoupdatingCurrent.identifier
    )
    
    static let deviceOSVersion = DebugValue(
        id: "deviceOSVersion",
        label: "OS Version",
        staticValue: "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
    )
    
    static let deviceOSModel = DebugValue(
        id: "deviceOSModel",
        label: "Model",
        staticValue: UIDevice.current.model
    )
    
    static let pushNotificationsRegistered = DebugValue(
        id: "pushNotificationsRegistered",
        label: "Registered?",
        value: UIApplication.shared.isRegisteredForRemoteNotifications
    )
}
