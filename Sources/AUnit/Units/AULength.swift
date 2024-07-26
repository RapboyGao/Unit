import Foundation

/// Enumeration representing various units of length.
/// 表示各种长度单位的枚举。
public enum AULength: AUnitProtocol, Identifiable {
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs

    /// Coefficient for converting units to meters.
    /// 将单位转换为米的系数。
    private var coefficient: Double {
        switch self {
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1.0e6
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1.0e-6
        case .nanometers: return 1.0e-9
        case .picometers: return 1.0e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 1.0e4
        case .lightyears: return 9.4607304725808e15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 1.495978707e11
        case .parsecs: return 3.0856775814913673e16
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .feet: return .feet
        case .nauticalMiles: return .nauticalMiles
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .miles: return .miles
        case .megameters: return .megameters
        case .hectometers: return .hectometers
        case .decameters: return .decameters
        case .decimeters: return .decimeters
        case .centimeters: return .centimeters
        case .millimeters: return .millimeters
        case .micrometers: return .micrometers
        case .nanometers: return .nanometers
        case .picometers: return .picometers
        case .inches: return .inches
        case .yards: return .yards
        case .scandinavianMiles: return .scandinavianMiles
        case .lightyears: return .lightyears
        case .fathoms: return .fathoms
        case .furlongs: return .furlongs
        case .astronomicalUnits: return .astronomicalUnits
        case .parsecs: return .parsecs
        }
    }

    /// The identifier for the length unit.
    /// 长度单位的标识符。
    public var id: AULength { self }

    /// The base unit for length is meters.
    /// 长度的基本单位是米。
    public static var baseUnit: AULength = .meters

    /// Converts a value to the base unit (meters).
    /// 将一个值转换为基础单位（米）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in meters.
    ///            以米为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    /// Converts a value from the base unit (meters).
    /// 从基础单位（米）转换值。
    /// - Parameter value: The value in meters.
    ///                    以米为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}
