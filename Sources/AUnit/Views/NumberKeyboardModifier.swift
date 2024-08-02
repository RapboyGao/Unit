import SwiftUI

#if os(iOS)
@available(iOS 15.0, *)
struct NumberKeyboardModifier: ViewModifier {
    @Binding var value: Double?
    var digits: Int

    @State private var rotationAngle: Double = 0 // State variable to track rotation
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .autocorrectionDisabled()
            .focused($isFocused)
            .keyboardType(.decimalPad)
            .textContentType(.oneTimeCode)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    if isFocused {
                        if let currentValue = value, !currentValue.isZero {
                            Button {
                                value = -currentValue
                            } label: {
                                Text(-currentValue, format: .number.precision(.significantDigits(0 ... digits)))
                                    .foregroundStyle(currentValue > 0 ? .red : .blue)
                            }
                        }
                        Spacer()
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                value = nil
                                withAnimation {
                                    rotationAngle -= 360
                                }
                            }
                            .rotationEffect(.degrees(rotationAngle)) // Apply rotation effect
                    }
                }
            }
    }
}
#endif
