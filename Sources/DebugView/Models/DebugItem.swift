import Foundation

/// This is used for saving different types of debug information into a `DebugContainer`
enum DebugItem: Identifiable {
    case value(DebugValue)
    case button(DebugButton)

    var id: String {
        switch self {
        case .value(let value):
            value.id
        case .button(let button):
            button.id
        }
    }
}
