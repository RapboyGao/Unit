import Foundation

public struct AQuantity<UnitType: AUnitProtocol>: AQuantityProtocol {
    public var unit: UnitType
    public var value: Double
    public init(value: Double, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
}

public extension AQuantity where UnitType: AProportionalUnitProtocol {
    func add(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value + other.value, unit: unit) }
        let value1 = unit.toBaseValue(value: value)
        let value2 = unit.toBaseValue(value: other.value)
        return AQuantity(value: value1 + value2, unit: .baseUnit)
    }

    func subtract(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value - other.value, unit: unit) }
        let value1 = unit.toBaseValue(value: value)
        let value2 = unit.toBaseValue(value: other.value)
        return AQuantity(value: value1 - value2, unit: .baseUnit)
    }
}
