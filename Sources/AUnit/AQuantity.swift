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
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 + value2, unit: .baseUnit)
    }

    func subtract(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value - other.value, unit: unit) }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 - value2, unit: .baseUnit)
    }

    func divided(by other: AQuantity<UnitType>) -> Double {
        guard unit != other.unit
        else { return value / other.value }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return value1 / value2
    }
}

// Length * Length = Area
public extension AQuantity where UnitType == AULength {
    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 * value2, unit: .squareMeters)
    }
}

// Length * Area = Volume
public extension AQuantity where UnitType == AULength {
    func multiply(by other: AQuantity<AUArea>) -> AQuantity<AUVolume> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AUVolume>(value: value1 * value2, unit: .cubicMeters)
    }
}

// Area * Length = Volume (交换操作)
public extension AQuantity where UnitType == AUArea {
    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUVolume> {
        other.multiply(by: self)
    }
}

// Length / Time = Speed
public extension AQuantity where UnitType == AULength {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 / value2, unit: .metersPerSecond)
    }
}

// Mass / Volume = Concentration
public extension AQuantity where UnitType == AUMass {
    func divided(by other: AQuantity<AUVolume>) -> AQuantity<AUConcentration> {
        let value1 = unit.convert(value: value, to: .grams)
        let value2 = other.unit.convert(value: other.value, to: .liters)
        return AQuantity<AUConcentration>(value: value1 / value2, unit: .gramsPerLiter)
    }
}

// Energy / Time = Power
public extension AQuantity where UnitType == AUEnergy {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUPower>(value: value1 / value2, unit: .watts)
    }
}

// Power * Time = Energy
public extension AQuantity where UnitType == AUPower {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUEnergy> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUEnergy>(value: value1 * value2, unit: .joules)
    }
}

// Time * Power = Energy (交换操作)
public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUPower>) -> AQuantity<AUEnergy> {
        other.multiply(by: self)
    }
}

// Speed * Time = Length
public extension AQuantity where UnitType == AUSpeed {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AULength>(value: value1 * value2, unit: .meters)
    }
}

// Time * Speed = Length (交换操作)
public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUSpeed>) -> AQuantity<AULength> {
        other.multiply(by: self)
    }
}

// Acceleration * Time = Speed
public extension AQuantity where UnitType == AUAcceleration {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .metersPerSecondSquared)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 * value2, unit: .metersPerSecond)
    }
}

// Time * Acceleration = Speed (交换操作)
public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUAcceleration>) -> AQuantity<AUSpeed> {
        other.multiply(by: self)
    }
}

// ElectricCurrent * ElectricPotential = Power
public extension AQuantity where UnitType == AUElectricCurrent {
    func multiply(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUPower>(value: value1 * value2, unit: .watts)
    }
}

// ElectricPotential * ElectricCurrent = Power (交换操作)
public extension AQuantity where UnitType == AUElectricPotential {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUPower> {
        other.multiply(by: self)
    }
}

// Volume / Area = Length
public extension AQuantity where UnitType == AUVolume {
    func divided(by other: AQuantity<AUArea>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .liters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }
}

// Volume / Length = Area
public extension AQuantity where UnitType == AUVolume {
    func divided(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .liters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 / value2, unit: .squareMeters)
    }
}

// Energy / ElectricPotential = ElectricChargeCapacity
public extension AQuantity where UnitType == AUEnergy {
    func divided(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUElectricChargeCapacity> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUElectricChargeCapacity>(value: value1 / value2, unit: .ampereHours)
    }
}

// Energy / ElectricChargeCapacity = ElectricPotential
public extension AQuantity where UnitType == AUEnergy {
    func divided(by other: AQuantity<AUElectricChargeCapacity>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .ampereHours)
        return AQuantity<AUElectricPotential>(value: value1 / value2, unit: .volts)
    }
}

// Angle / Time = AngularVelocity
public extension AQuantity where UnitType == AUAngle {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAngularVelocity> {
        let value1 = unit.convert(value: value, to: .radians)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngularVelocity>(value: value1 / value2, unit: .radiansPerSecond)
    }
}

// AngularVelocity * Time = Angle
public extension AQuantity where UnitType == AUAngularVelocity {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUAngle> {
        let value1 = unit.convert(value: value, to: .radiansPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngle>(value: value1 * value2, unit: .radians)
    }
}

// Time * AngularVelocity = Angle (交换操作)
public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUAngularVelocity>) -> AQuantity<AUAngle> {
        other.multiply(by: self)
    }
}

// Speed / Time = Acceleration
public extension AQuantity where UnitType == AUSpeed {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAcceleration> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAcceleration>(value: value1 / value2, unit: .metersPerSecondSquared)
    }
}

// ElectricPotential / ElectricCurrent = ElectricResistance
public extension AQuantity where UnitType == AUElectricPotential {
    func divided(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricResistance> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .amperes)
        return AQuantity<AUElectricResistance>(value: value1 / value2, unit: .ohms)
    }
}

// ElectricPotential / ElectricResistance = ElectricCurrent
public extension AQuantity where UnitType == AUElectricPotential {
    func divided(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricCurrent> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricCurrent>(value: value1 / value2, unit: .amperes)
    }
}

// ElectricCurrent * ElectricResistance = ElectricPotential
public extension AQuantity where UnitType == AUElectricCurrent {
    func multiply(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricPotential>(value: value1 * value2, unit: .volts)
    }
}

// ElectricResistance * ElectricCurrent = ElectricPotential (交换操作)
public extension AQuantity where UnitType == AUElectricResistance {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricPotential> {
        other.multiply(by: self)
    }
}
