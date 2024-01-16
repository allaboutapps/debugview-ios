import Foundation

/// Creates a section to show in the `DebugScreen`
public struct DebugSection: Identifiable {
    public let id: String
    public let label: String

    public init(id: String, label: String) {
        self.id = id
        self.label = label
    }
}
