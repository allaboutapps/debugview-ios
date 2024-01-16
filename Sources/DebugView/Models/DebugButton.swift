import Foundation

/// Creates a button to show in the `DebugScreen`
public struct DebugButton: Identifiable {
    public let id: String
    public let label: String
    public let action: () -> Void

    public init(
        id: String,
        label: String,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.label = label
        self.action = action
    }
}
