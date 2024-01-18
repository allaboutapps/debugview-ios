import Foundation
import SwiftUI

public struct DebugScreen: View {
    // MARK: Init

    private let sections: [FinalDebugContainer]
    private let appearance: DebugScreenAppearance

    public init(
        controller: DebugController,
        appearance: DebugScreenAppearance
    ) {
        self.sections = controller.renderDebugSections()
        self.appearance = appearance
    }

    // MARK: Body

    public var body: some View {
        List {
            ForEach(sections) { section in
                Section {
                    ForEach(section.items) { item in
                        viewFor(item: item)
                    }
                } header: {
                    sectionHeader(section: section)
                }
            }
            shareAllButton
        }
        .tint(appearance.tintColor)
    }

    // MARK: Helpers

    @ViewBuilder
    private func viewFor(item: FinalDebugItem) -> some View {
        switch item {
        case .value(let value):
            FinalDebugValueView(value: value)
        case .button(let button):
            Button(action: {
                button.action()
            }, label: {
                Text(button.label)
            })
        }
    }

    private func sectionHeader(section: FinalDebugContainer) -> some View {
        HStack(alignment: .center, spacing: .zero) {
            Text(section.section.label)

            Spacer()

            ShareLink(
                item: section.shareableText,
                label: {
                    Image(systemName: "square.and.arrow.up")
                }
            )
        }
    }

    private var shareAllButton: some View {
        ShareLink(
            item: sections.shareableText,
            label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share All")
                }
            }
        )
    }
}

// MARK: - Previews

#Preview {
    DebugScreen(
        controller: DebugController.createTestController(),
        appearance: DebugScreenAppearance(tintColor: .green)
    )
}

private extension DebugController {
    static func createTestController() -> DebugController {
        let controller = DebugController()
        controller.addValue(
            DebugValue(
                id: "version",
                label: "Version",
                staticValue: "1.0.0"
            ),
            toSection: .app
        )

        controller.addValue(
            DebugValue(
                id: "diceRoll",
                label: "Dice Rolled",
                value: String(Int.random(in: 1 ... 6))
            ),
            toSection: .app
        )

        controller.addButton(
            DebugButton(
                id: "button",
                label: "Button",
                action: {
                    print("Button pressed")
                }
            ),
            toSection: .user
        )

        return controller
    }
}
