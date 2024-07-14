import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct AUnitAnyTypeSelectorView<Label: View, Content: View>: View {
    private var showNil: Bool
    private var label: (AUnit) -> Label
    private var content: () -> Content
    private var onSelect: (AUnit?) -> Void

    public var body: some View {
        Menu {
            if showNil {
                Button("None") {
                    onSelect(nil)
                }
            }
            AUnitAnyTypeForeachMenuView { unitType in
                Text(unitType.shortName)
            } content: { unit in
                Button {
                    onSelect(unit)
                } label: {
                    label(unit)
                }
            }
        } label: {
            content()
        }
    }

    public init(showNil: Bool, @ViewBuilder label: @escaping (AUnit) -> Label, @ViewBuilder content: @escaping () -> Content, onSelect: @escaping (AUnit?) -> Void) {
        self.showNil = showNil
        self.label = label
        self.content = content
        self.onSelect = onSelect
    }
}
