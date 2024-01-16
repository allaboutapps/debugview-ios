import Foundation

/// A controller that handles debug items for the Debug feature.
public class DebugController {
    // MARK: - Interface

    public init() {}

    /// Adds a button to the debug store at the corresponding section
    public func addButton(_ button: DebugButton, toSection section: DebugSection) {
        add(item: .button(button), toSection: section)
    }

    /// Adds a value to the debug store at the corresponding section
    public func addValue(_ value: DebugValue, toSection section: DebugSection) {
        add(item: .value(value), toSection: section)
    }

    // MARK: - Private

    private func add(item: DebugItem, toSection section: DebugSection) {
        if !containers.contains(where: { $0.section.id == section.id }) {
            containers.append(.init(section: section))
        }

        guard let container = containers.first(where: { $0.section.id == section.id })
        else { return }

        // if the item already exists, remove it to override it
        if container.items.contains(where: { $0.id == item.id }) {
            container.items.removeAll(where: { $0.id == item.id })
        }

        container.items.append(item)
    }

    private var containers = [DebugContainer]()

    // MARK: Helpers

    /// Renders sections and values for the debug screen.
    func renderDebugSections() -> [FinalDebugContainer] {
        containers.map(FinalDebugContainer.init)
    }
}
