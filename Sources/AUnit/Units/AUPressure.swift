import Foundation

/// Enumeration representing various units of pressure.
/// 表示各种压力单位的枚举。
public enum AUPressure: AUnitProtocol, Identifiable {
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch

    /// Coefficient for converting units to newtons per square meter.
    /// 将单位转换为牛顿每平方米的系数。
    private var coefficient: Double {
        switch self {
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1.0e9
        case .megapascals: return 1.0e6
        case .kilopascals: return 1000.0
        case .bars: return 1.0e5
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .hectopascals: return .hectopascals
        case .inchesOfMercury: return .inchesOfMercury
        case .millimetersOfMercury: return .millimetersOfMercury
        case .newtonsPerMetersSquared: return .newtonsPerMetersSquared
        case .gigapascals: return .gigapascals
        case .megapascals: return .megapascals
        case .kilopascals: return .kilopascals
        case .bars: return .bars
        case .millibars: return .millibars
        case .poundsForcePerSquareInch: return .poundsForcePerSquareInch
        }
    }

    /// The identifier for the pressure unit.
    /// 压力单位的标识符。
    public var id: AUPressure { self }

    /// The base unit for pressure is newtons per square meter.
    /// 压力的基本单位是牛顿每平方米。
    public static var baseUnit: AUPressure = .newtonsPerMetersSquared

    /// Converts a value to the base unit (newtons per square meter).
    /// 将一个值转换为基础单位（牛顿每平方米）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in newtons per square meter.
    ///            以牛顿每平方米为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    /// Converts a value from the base unit (newtons per square meter).
    /// 从基础单位（牛顿每平方米）转换值。
    /// - Parameter value: The value in newtons per square meter.
    ///                    以牛顿每平方米为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
