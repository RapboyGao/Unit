import Foundation

/// Enumeration representing various units of volume.
/// 表示各种体积单位的枚举。
public enum AUVolume: AUnitProtocol, Identifiable {
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups

    /// Coefficient for converting units to liters.
    /// 将单位转换为升的系数。
    private var coefficient: Double {
        switch self {
        case .liters: return 1.0
        case .quarts: return 0.946352946
        case .cubicMeters: return 1000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.785411784
        case .megaliters: return 1.0e6
        case .kiloliters: return 1000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1.0e12
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1.0e-6
        case .cubicInches: return 0.016387064
        case .cubicFeet: return 28.316846592
        case .cubicYards: return 764.554857984
        case .cubicMiles: return 4.168181825440579584e12
        case .acreFeet: return 1_233_481.83754752
        case .bushels: return 35.23907016688
        case .teaspoons: return 0.00492892159375
        case .tablespoons: return 0.01478676478125
        case .fluidOunces: return 0.0295735295625
        case .cups: return 0.24
        case .pints: return 0.473176473
        case .imperialTeaspoons: return 0.00591938802083333
        case .imperialTablespoons: return 0.0177581640625
        case .imperialFluidOunces: return 0.0284130625
        case .imperialPints: return 0.56826125
        case .imperialQuarts: return 1.1365225
        case .imperialGallons: return 4.54609
        case .metricCups: return 0.25
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var aUnit: AUnit {
        switch self {
        case .liters: return .liters
        case .quarts: return .quarts
        case .cubicMeters: return .cubicMeters
        case .cubicCentimeters: return .cubicCentimeters
        case .gallons: return .gallons
        case .megaliters: return .megaliters
        case .kiloliters: return .kiloliters
        case .deciliters: return .deciliters
        case .centiliters: return .centiliters
        case .milliliters: return .milliliters
        case .cubicKilometers: return .cubicKilometers
        case .cubicDecimeters: return .cubicDecimeters
        case .cubicMillimeters: return .cubicMillimeters
        case .cubicInches: return .cubicInches
        case .cubicFeet: return .cubicFeet
        case .cubicYards: return .cubicYards
        case .cubicMiles: return .cubicMiles
        case .acreFeet: return .acreFeet
        case .bushels: return .bushels
        case .teaspoons: return .teaspoons
        case .tablespoons: return .tablespoons
        case .fluidOunces: return .fluidOunces
        case .cups: return .cups
        case .pints: return .pints
        case .imperialTeaspoons: return .imperialTeaspoons
        case .imperialTablespoons: return .imperialTablespoons
        case .imperialFluidOunces: return .imperialFluidOunces
        case .imperialPints: return .imperialPints
        case .imperialQuarts: return .imperialQuarts
        case .imperialGallons: return .imperialGallons
        case .metricCups: return .metricCups
        }
    }

    /// The identifier for the volume unit.
    /// 体积单位的标识符。
    public var id: AUVolume { self }

    /// The base unit for volume is liters.
    /// 体积的基本单位是升。
    public static var baseUnit: AUVolume = .liters

    /// Converts a value to the base unit (liters).
    /// 将一个值转换为基础单位（升）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in liters.
    ///            以升为单位的值。
    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    /// Converts a value from the base unit (liters).
    /// 从基础单位（升）转换值。
    /// - Parameter value: The value in liters.
    ///                    以升为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
