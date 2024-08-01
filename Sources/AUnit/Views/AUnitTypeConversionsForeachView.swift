import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
public struct AUnitTypeConversionsForeachView: View {
    @Binding var unitType: AUnitType
    @State private var value: Double?

    var digits: Int

    private var allUnits: [AUnit] {
        unitType.allUnits
    }

    public var body: some View {
        ForEach(allUnits) { unit in
            AUnitInputHStackFixedUnit(value: $value, unit: unit, originalUnit: unitType.baseUnit, digits: 10, placeHolder: unit.shortName)
        }
    }

    init(unitType: Binding<AUnitType>, digits: Int = 10) {
        self._unitType = unitType
        self.digits = digits
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    NavigationView {
        List {
            ForEach(AUnitType.allCases) { unitType in
                Section(unitType.shortName) {
                    AUnitTypeConversionsForeachView(unitType: .constant(unitType))
                }
            }
        }
    }
}
