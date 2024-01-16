import Foundation

class DebugContainer {
    let section: DebugSection
    var items = [DebugItem]()

    init(section: DebugSection) {
        self.section = section
    }
}
