import Foundation

public extension DebugSection {
    static let app = DebugSection(id: "app", label: "App")
    static let user = DebugSection(id: "user", label: "User")
    static let device = DebugSection(id: "device", label: "Device")
    static let pushNotifications = DebugSection(id: "pushNotifications", label: "Push Notifications")
}
