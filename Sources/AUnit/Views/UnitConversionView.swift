import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct UnitConversionView: View {
    @State private var selectedUnitType: AUnitType = .length
    @State private var inputValues: [AUnit: String] = [:]

    var filteredUnits: [AUnit] {
        AUnit.allCases.filter { $0.unitType == selectedUnitType }
    }

    var body: some View {
        List {
            Picker("Unit Type", selection: $selectedUnitType) {
                ForEach(AUnitType.allCases, id: \.self) { unitType in
                    Text(unitType.shortName).tag(unitType)
                }
            }

            ForEach(filteredUnits, id: \.self) { unit in
                HStack {
                    TextField("Value", text: Binding(
                        get: { inputValues[unit] ?? "" },
                        set: { newValue in
                            inputValues[unit] = newValue
                            convertValues(from: unit, newValue: newValue)
                        }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.decimalPad)

                    Text(unit.symbol)
                        .padding(.leading, 8)
                }
                .padding(.horizontal)
            }
        }
    }

    private func convertValues(from sourceUnit: AUnit, newValue: String) {
        guard let sourceValue = Double(newValue) else {
            inputValues = [:]
            return
        }

        for unit in filteredUnits {
            if unit != sourceUnit {
                if let convertedValue = sourceUnit.convert(value: sourceValue, to: unit) {
                    inputValues[unit] = String(format: "%.4f", convertedValue)
                }
            }
        }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
#Preview {
    UnitConversionView()
        .environment(\.locale, .init(identifier: "en"))
}
