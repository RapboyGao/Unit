import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
/// A view for inputting a value and selecting a unit.
/// 提供输入值和选择单位的视图。
public struct AUnitInputView<Label: View>: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit
    private var digits: Int
    private var placeHolder: String
    private var label: () -> Label

    @FocusState private var isFocused: Bool

    private var bindUnit: Binding<AUnit?> {
        Binding {
            guard originalUnit.unitType == unit?.unitType
            else { return originalUnit }
            return unit
        } set: {
            unit = $0
        }
    }

    private var convertedValue: Binding<Double?> {
        Binding<Double?>(
            get: {
                guard let value = value,
                      let unit = bindUnit.wrappedValue
                else { return value }
                return originalUnit.convert(value: value, to: unit)
            },
            set: { newValue in
                guard let newValue = newValue,
                      let unit = bindUnit.wrappedValue
                else {
                    value = newValue
                    return
                }
                value = unit.convert(value: newValue, to: originalUnit)
            }
        )
    }

    public var body: some View {
        HStack {
            label()
            TextField(
                placeHolder,
                value: convertedValue,
                format: .number.precision(.significantDigits(0 ... digits))
            )
            .focused($isFocused)
            .multilineTextAlignment(.trailing)
#if os(iOS)
                .modifier(NumberKeyboardModifier(value: $value, focused: isFocused, digits: digits))
#endif
            AUnitEasySelectorView(unit: bindUnit, filter: originalUnit.unitType)
        }
    }

    /// Initializes a new instance of `UnitInputView`.
    /// 初始化 `UnitInputView` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeHolder: The placeholder text for the text field.
    ///   - label: A view builder for the label to be displayed before the text field.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeHolder: String, @ViewBuilder label: @escaping () -> Label) {
        self._value = value
        self._unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeHolder = placeHolder
        self.label = label
    }

    /// Initializes a new instance of `UnitInputView` with a default label.
    /// 初始化 `UnitInputView` 的新实例，并使用默认标签。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeHolder: The placeholder text for the text field, which is also used as the label.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeHolder: String) where Label == Text {
        self._value = value
        self._unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeHolder = placeHolder
        self.label = { Text(placeHolder) }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct UnitInputViewExample: View {
    @State private var value: Double? = 1500
    @State private var unit1: AUnit? = .fahrenheit
    @State private var unit2: AUnit? = .feet

    var body: some View {
        NavigationView {
            List {
                AUnitInputView(
                    value: $value,
                    unit: $unit1,
                    .meters,
                    digits: 5,
                    placeHolder: "1"
                )
                AUnitInputView(
                    value: $value,
                    unit: $unit2,
                    .meters,
                    digits: 5,
                    placeHolder: "2"
                )
            }
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    UnitInputViewExample()
}
