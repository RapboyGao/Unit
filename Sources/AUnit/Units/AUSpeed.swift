import Foundation

/// Enumeration representing various units of speed.
/// 表示各种速度单位的枚举。
public enum AUSpeed: AUnitProtocol, Identifiable {
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond

    /// Coefficient for converting units to meters per second.
    /// 将单位转换为米每秒的系数。
    private var coefficient: Double {
        switch self {
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .knots: return .knots
        case .metersPerSecond: return .metersPerSecond
        case .feetPerMinute: return .feetPerMinute
        case .kilometersPerHour: return .kilometersPerHour
        case .feetPerSecond: return .feetPerSecond
        case .milesPerHour: return .milesPerHour
        case .inchesPerSecond: return .inchesPerSecond
        case .yardsPerSecond: return .yardsPerSecond
        }
    }

    /// The identifier for the speed unit.
    /// 速度单位的标识符。
    public var id: AUSpeed { self }

    /// The base unit for speed is meters per second.
    /// 速度的基本单位是米每秒。
    public static var baseUnit: AUSpeed = .metersPerSecond

    /// Converts a value to the base unit (meters per second).
    /// 将一个值转换为基础单位（米每秒）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in meters per second.
    ///            以米每秒为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    /// Converts a value from the base unit (meters per second).
    /// 从基础单位（米每秒）转换值。
    /// - Parameter value: The value in meters per second.
    ///                    以米每秒为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
