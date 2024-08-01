import SwiftUI

#if os(iOS)
@available(iOS 15.0, *)
struct NumberKeyboardModifier: ViewModifier {
    @Binding var value: Double?
    var focused: Bool
    var digits: Int

    @State private var rotationAngle: Double = 0 // State variable to track rotation

    func body(content: Content) -> some View {
        content
            .keyboardType(.decimalPad) // Ensure decimal keyboard for numeric input
            .textContentType(.oneTimeCode) // This allows negative sign input on iOS
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    if focused {
                        if let currentValue = value {
                            Button {
                                value = -currentValue
                            } label: {
                                Text(-currentValue, format: .number.precision(.significantDigits(0 ... digits)))
                                    .foregroundStyle(currentValue > 0 ? .red : .blue)
                            }
                        }
                        Spacer()
                        Button {
                            value = nil
                            withAnimation {
                                rotationAngle -= 360
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }
                        .rotationEffect(.degrees(rotationAngle)) // Apply rotation effect
                    }
                }
            }
    }
}
#endif
