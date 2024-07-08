import Foundation

/// A struct representing a measurement with a specific value and unit.
/// 表示具有特定值和单位的测量结构。
public struct AMeasurement: Codable, Sendable, Hashable {
    /// The value of the measurement.
    /// 测量的值。
    public var value: Double
    /// The unit of the measurement.
    /// 测量的单位。
    public var unit: AUnit

    /// Initializes a new measurement with the given value and unit.
    /// 使用给定的值和单位初始化一个新的测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///   - unit: The unit of the measurement.
    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    /// Converts the measurement to a target unit.
    /// 将测量值转换为目标单位。
    /// - Parameter targetUnit: The unit to convert to.
    /// - Returns: A new measurement converted to the target unit, or nil if conversion is not possible.
    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    /// A description of the measurement.
    /// 测量的描述。
    public var description: String {
        return "\(self.value) \(self.unit.symbol)"
    }

    /// Adds another measurement to this measurement.
    /// 将另一个测量值添加到此测量值中。
    /// - Parameter other: The other measurement to add.
    /// - Returns: A new measurement representing the sum, or nil if the units are incompatible.
    public func adding(_ other: AMeasurement) -> AMeasurement? {
        if self.unit.unitType == .temperature && other.unit.unitType == .temperatureDifference {
            if let otherConverted = other.converted(to: self.unit) {
                return AMeasurement(value: self.value + otherConverted.value, unit: self.unit)
            }
        } else if self.unit.unitType == .temperatureDifference && other.unit.unitType == .temperature {
            if let selfConverted = self.converted(to: other.unit) {
                return AMeasurement(value: selfConverted.value + other.value, unit: other.unit)
            }
        } else if self.unit.unitType == other.unit.unitType {
            if let otherConverted = other.converted(to: self.unit) {
                return AMeasurement(value: self.value + otherConverted.value, unit: self.unit)
            }
        }
        return nil
    }

    /// Subtracts another measurement from this measurement.
    /// 从此测量值中减去另一个测量值。
    /// - Parameter other: The other measurement to subtract.
    /// - Returns: A new measurement representing the difference, or nil if the units are incompatible.
    public func subtracting(_ other: AMeasurement) -> AMeasurement? {
        if self.unit.unitType == .temperature && other.unit.unitType == .temperatureDifference {
            if let otherConverted = other.converted(to: self.unit) {
                return AMeasurement(value: self.value - otherConverted.value, unit: self.unit)
            }
        } else if self.unit.unitType == other.unit.unitType {
            if let otherConverted = other.converted(to: self.unit) {
                return AMeasurement(value: self.value - otherConverted.value, unit: self.unit)
            }
        }
        return nil
    }

    /// Multiplies this measurement by another measurement.
    /// 将此测量值乘以另一个测量值。
    /// - Parameter other: The other measurement to multiply by.
    /// - Returns: A new measurement representing the product, or nil if the units are incompatible.
    public func multiplying(by other: AMeasurement, recalculate: Bool = false) -> AMeasurement? {
        switch (self.unit.unitType, other.unit.unitType) {
        case (.length, .length):
            guard let selfInMeters = self.converted(to: .meters),
                  let otherInMeters = other.converted(to: .meters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInMeters.value, unit: .squareMeters)
        case (.length, .area):
            guard let selfInMeters = self.converted(to: .meters),
                  let otherInSquareMeters = other.converted(to: .squareMeters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInSquareMeters.value, unit: .cubicMeters)
        case (.electricCurrent, .electricPotential):
            guard let selfInAmperes = self.converted(to: .amperes),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInAmperes.value * otherInVolts.value, unit: .watts)
        case (.power, .time):
            guard let selfInWatts = self.converted(to: .watts),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInWatts.value * otherInSeconds.value, unit: .joules)
        case (.speed, .time):
            guard let selfInMetersPerSecond = self.converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value * otherInSeconds.value, unit: .meters)
        case (.acceleration, .time):
            guard let selfInMetersPerSecondSquared = self.converted(to: .metersPerSecondSquared),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecondSquared.value * otherInSeconds.value, unit: .metersPerSecond)
        // 其他乘法操作（可根据需要扩展）
        default:
            guard recalculate
            else { return other.multiplying(by: self, recalculate: true) }
            return nil
        }
    }

    /// Multiplies this measurement by a scalar.
    /// 将此测量值乘以一个标量。
    /// - Parameter scalar: The scalar to multiply by.
    /// - Returns: A new measurement representing the product.
    public func multiplying(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: self.value * scalar, unit: self.unit)
    }

    /// Divides this measurement by another measurement.
    /// 将此测量值除以另一个测量值。
    /// - Parameter other: The other measurement to divide by.
    /// - Returns: A new measurement representing the quotient, or nil if the units are incompatible.
    public func dividing(by other: AMeasurement) -> AMeasurement? {
        switch (self.unit.unitType, other.unit.unitType) {
        case (.length, .time):
            guard let selfInMeters = self.converted(to: .meters),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMeters.value / otherInSeconds.value, unit: .metersPerSecond)
        case (.mass, .volume):
            guard let selfInKilograms = self.converted(to: .kilograms),
                  let otherInLiters = other.converted(to: .liters) else { return nil }
            return AMeasurement(value: selfInKilograms.value / otherInLiters.value, unit: .gramsPerLiter)
        case (.electricPotential, .electricCurrent):
            guard let selfInVolts = self.converted(to: .volts),
                  let otherInAmperes = other.converted(to: .amperes) else { return nil }
            return AMeasurement(value: selfInVolts.value / otherInAmperes.value, unit: .ohms)
        case (.energy, .time):
            guard let selfInJoules = self.converted(to: .joules),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInSeconds.value, unit: .watts)
        case (.speed, .time):
            guard let selfInMetersPerSecond = self.converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value / otherInSeconds.value, unit: .metersPerSecondSquared)
        // 其他除法操作（可根据需要扩展）
        default:
            return nil
        }
    }

    /// Divides this measurement by a scalar.
    /// 将此测量值除以一个标量。
    /// - Parameter scalar: The scalar to divide by.
    /// - Returns: A new measurement representing the quotient.
    public func dividing(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: self.value / scalar, unit: self.unit)
    }
}
