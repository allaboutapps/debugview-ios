import Foundation

extension FinalDebugValue {
    var shareableText: String {
        return "\(label): \(value)"
    }
}

extension FinalDebugContainer {
    var shareableText: String {
        let textValues = items.compactMap { type in
            switch type {
            case .value(let value):
                return value.shareableText
            case .button:
                return nil
            }
        }

        let sectionHeader = "--- \(section.label) ---\n"
        let reduced = textValues.reduce(into: sectionHeader) { partialResult, current in
            partialResult += current
            partialResult += "\n"
        }
        return reduced
    }
}

extension [FinalDebugContainer] {
    var shareableText: String {
        guard !isEmpty else { return "-" }
        return reduce(into: "") { partialResult, section in
            partialResult += section.shareableText
            partialResult += "\n"
        }
    }
}
