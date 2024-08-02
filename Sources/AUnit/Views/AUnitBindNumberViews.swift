import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
public struct AUnitBindNumberViews: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit?
    private var digits: Int
    private var placeholder: String
    private var allowInput: Bool

    public var body: some View {
        if let originalUnit = originalUnit {
            if allowInput {
                AUnitInputViews(value: $value, unit: $unit, originalUnit, digits: digits, placeholder: placeholder)
            } else {}
        } else {
            if allowInput {
            } else {}
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitBindNumberViews(value: <#T##Double?#>, unit: <#T##AUnit?#>, originalUnit: <#T##AUnit?#>, digits: <#T##Int#>, placeholder: <#T##String#>, allowInput: <#T##Bool#>)
}
