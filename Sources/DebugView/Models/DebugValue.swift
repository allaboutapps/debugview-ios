import Foundation

/// Creates a value to show in the `DebugScreen`
public struct DebugValue: Identifiable {
    public let id: String
    public let label: String
    public let value: () -> String?

    // MARK: - Static

    /// Creates a static value.  Static means that the value is evaluated at the time of instantiation.
    public init(
        id: String,
        label: String,
        staticValue: String?
    ) {
        self.init(id: id, label: label, value: staticValue)
    }

    /// Creates a static value.  Static means that the value is evaluated at the time of instantiation.
    public init(
        id: String,
        label: String,
        staticValue: CustomDebugStringConvertible?
    ) {
        self.init(id: id, label: label, value: staticValue?.debugDescription)
    }

    /// Creates a static value.  Static means that the value is evaluated at the time of instantiation.
    public init(
        id: String,
        label: String,
        staticValue: CustomStringConvertible?
    ) {
        self.init(id: id, label: label, value: staticValue?.description)
    }

    // MARK: - Closure

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @escaping () -> String?
    ) {
        self.id = id
        self.label = label
        self.value = value
    }

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @escaping () -> CustomDebugStringConvertible?
    ) {
        self.init(id: id, label: label, value: value()?.debugDescription)
    }

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @escaping () -> CustomStringConvertible?
    ) {
        self.init(id: id, label: label, value: value()?.description)
    }

    // MARK: - AutoClosure

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @autoclosure @escaping () -> String?
    ) {
        self.id = id
        self.label = label
        self.value = value
    }

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @autoclosure @escaping () -> CustomDebugStringConvertible?
    ) {
        self.init(id: id, label: label, value: value()?.debugDescription)
    }

    /// Creates a dynamic value. Dynamic means that the value is evaluated when the debug screen is shown.
    public init(
        id: String,
        label: String,
        value: @autoclosure @escaping () -> CustomStringConvertible?
    ) {
        self.init(id: id, label: label, value: value()?.description)
    }
}
