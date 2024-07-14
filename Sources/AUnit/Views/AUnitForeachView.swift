import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AUnitForeachView<Content: View>: View {
    private var typeFilter: AUnitType
    private var content: (AUnit) -> Content

    private var unitsOfTheSameType: [AUnit] {
        AUnit.allCases.filter { unit in
            unit.unitType == typeFilter
        }
    }

    public var body: some View {
        ForEach(unitsOfTheSameType) { unit in
            content(unit)
        }
    }

    public init(typeFilter: AUnitType, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.typeFilter = typeFilter
        self.content = content
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
#Preview {
    List {
        AUnitForeachView(typeFilter: .length) { unit in
            Text(unit.longName)
        }
    }
}
