import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct AUnitAnyTypeEasySelectorView: View {
    @Binding private var unit: AUnit?

    public var body: some View {
        AUnitAnyTypeSelectorView(showNil: true) { unit in
            Text(unit.symbol + " / " + unit.longName)
        } content: {
            if let unit = unit {
                Text(unit.shortName)
            } else {
                Text("None")
            }
        } onSelect: {
            unit = $0
        }
    }

    public init(unit: Binding<AUnit?>) {
        self._unit = unit
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitAnyTypeEasySelectorView(unit: .constant(.fahrenheit))
}
