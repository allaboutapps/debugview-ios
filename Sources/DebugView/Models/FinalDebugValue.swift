import Foundation

struct FinalDebugValue: Identifiable {
    let id: String
    let label: String
    let value: String

    init(id: String, label: String, value: String) {
        self.id = id
        self.label = label
        self.value = value
    }

    init(value: DebugValue) {
        self.init(
            id: value.id,
            label: value.label,
            value: value.value() ?? "-"
        )
    }
}
