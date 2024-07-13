import Foundation

/// Enum representing the types of units.
/// 表示单位类型的枚举。
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data

    /// The symbol for the unit type.
    /// 单位类型的符号。
    /// 尽可能一个字/词
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit type.
    /// 单位类型的短名称。
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit type.
    /// 单位类型的全名称。
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }
}
