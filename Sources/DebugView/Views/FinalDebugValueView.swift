import SwiftUI

struct FinalDebugValueView: View {
    let value: FinalDebugValue

    var body: some View {
        ViewThatFits {
            DebugHorizontalRow(
                label: value.label,
                value: value.value
            )
            DebugVerticalRow(
                label: value.label,
                value: value.value
            )
        }
        .contextMenu {
            Button(
                action: {
                    UIPasteboard.general.string = value.value
                },
                label: {
                    Label("Copy to clipboard", systemImage: "doc.on.doc")
                }
            )
            ShareLink(item: value.shareableText)
        }
    }
}

#Preview {
    FinalDebugValueView(
        value: FinalDebugValue(
            id: "final",
            label: "Final Value",
            value: "Value"
        )
    )
}
