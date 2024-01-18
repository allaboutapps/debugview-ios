import Foundation

/// This is used for pre-rendering the debug information before displaying it
enum FinalDebugItem: Identifiable {
    case value(FinalDebugValue)
    case button(DebugButton)

    var id: String {
        switch self {
        case .value(let value):
            return value.id
        case .button(let button):
            return button.id
        }
    }

    init(item: DebugItem) {
        switch item {
        case .value(let value):
            self = .value(.init(value: value))
        case .button(let button):
            self = .button(button)
        }
    }
}
