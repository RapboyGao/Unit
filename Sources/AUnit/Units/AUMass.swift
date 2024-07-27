import Foundation

/// Enumeration representing various units of mass.
/// 表示各种质量单位的枚举。
public enum AUMass: AUnitProtocol, Identifiable {
    case metricTons, shortTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, stones, carats, ouncesTroy, slugs

    /// Coefficient for converting units to grams.
    /// 将单位转换为克的系数。
    private var coefficient: Double {
        switch self {
        case .metricTons: return 1.0e6
        case .shortTons: return 907_184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 4.5359237e5
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1.0e-6
        case .nanograms: return 1.0e-9
        case .picograms: return 1.0e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .metricTons: return .metricTons
        case .shortTons: return .shortTons
        case .kilograms: return .kilograms
        case .kilopounds: return .kilopounds
        case .pounds: return .pounds
        case .ounces: return .ounces
        case .grams: return .grams
        case .decigrams: return .decigrams
        case .centigrams: return .centigrams
        case .milligrams: return .milligrams
        case .micrograms: return .micrograms
        case .nanograms: return .nanograms
        case .picograms: return .picograms
        case .stones: return .stones
        case .carats: return .carats
        case .ouncesTroy: return .ouncesTroy
        case .slugs: return .slugs
        }
    }

    /// The identifier for the mass unit.
    /// 质量单位的标识符。
    public var id: AUMass { self }

    /// The base unit for mass is grams.
    /// 质量的基本单位是克。
    public static var baseUnit: AUMass = .grams

    /// Converts a value to the base unit (grams).
    /// 将一个值转换为基础单位（克）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in grams.
    ///            以克为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    /// Converts a value from the base unit (grams).
    /// 从基础单位（克）转换值。
    /// - Parameter value: The value in grams.
    ///                    以克为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}
