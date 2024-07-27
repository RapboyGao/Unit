import Foundation

/// Enumeration representing various units of time.
/// 表示各种时间单位的枚举。
public enum AUTime: AUnitProtocol, Identifiable {
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries

    /// Coefficient for converting units to seconds.
    /// 将单位转换为秒的系数。
    private var coefficient: Double {
        switch self {
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1.0e-6
        case .nanoseconds: return 1.0e-9
        case .picoseconds: return 1.0e-12
        case .days: return 86400.0
        case .weeks: return 604_800.0
        case .years: return 3.15576e7
        case .decades: return 3.15576e8
        case .centuries: return 3.15576e9
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .hours: return .hours
        case .minutes: return .minutes
        case .seconds: return .seconds
        case .milliseconds: return .milliseconds
        case .microseconds: return .microseconds
        case .nanoseconds: return .nanoseconds
        case .picoseconds: return .picoseconds
        case .days: return .days
        case .weeks: return .weeks
        case .years: return .years
        case .decades: return .decades
        case .centuries: return .centuries
        }
    }

    /// The identifier for the time unit.
    /// 时间单位的标识符。
    public var id: AUTime { self }

    /// The base unit for time is seconds.
    /// 时间的基本单位是秒。
    public static var baseUnit: AUTime = .seconds

    /// Converts a value to the base unit (seconds).
    /// 将一个值转换为基础单位（秒）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in seconds.
    ///            以秒为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    /// Converts a value from the base unit (seconds).
    /// 从基础单位（秒）转换值。
    /// - Parameter value: The value in seconds.
    ///                    以秒为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
