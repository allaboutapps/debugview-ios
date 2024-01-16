import Foundation

struct FinalDebugContainer: Identifiable {
    let id: String
    let section: DebugSection
    let items: [FinalDebugItem]

    init(container: DebugContainer) {
        self.id = container.section.id
        self.section = container.section
        self.items = container.items.map(FinalDebugItem.init)
    }
}
