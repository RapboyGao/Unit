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
            } else {
                AUnitValueViews(unit: $unit, value: value, originalUnit: originalUnit, digits: digits)
            }
        } else {
            if allowInput {
                TextField(placeholder, value: $value, format: .number.precision(.significantDigits(0 ... digits)))
                    .modifier(NumberKeyboardModifier(value: $value, digits: digits))
            } else {
                Spacer()
                if let value = value {
                    Text("= ")
                        +
                        Text(value, format: .number.precision(.significantDigits(0 ... digits)))
                } else {
                    Text(verbatim: "-")
                }
            }
        }
    }

    public init(value: Binding<Double?>, unit: Binding<AUnit?>, origin originalUnit: AUnit?, digits: Int, placeholder: String, allowInput: Bool) {
        self._value = value
        self._unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        self.allowInput = allowInput
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
#Preview {
    List {
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.fahrenheit), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.fahrenheit), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
    }
}
