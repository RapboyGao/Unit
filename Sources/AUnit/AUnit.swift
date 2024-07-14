import Foundation

/// Enum representing various units.
/// 表示各种单位的枚举。
public enum AUnit: Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Speed
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond
    // Pressure
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch
    // Temperature
    case kelvin, celsius, fahrenheit, rankine
    // TemperatureDifference
    case celsiusDelta, fahrenheitDelta
    // Mass
    case metricTons, shortTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, stones, carats, ouncesTroy, slugs
    // Volume
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
    // Acceleration
    case metersPerSecondSquared, gravity
    // Power
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower
    // Angle
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions
    // Angular Velocity
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond
    // Area
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares
    // Concentration
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion
    // Time
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries
    // ElectricChargeCapacity
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, ampereSeconds
    // ElectricCurrent
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes
    // ElectricPotential
    case megavolts, kilovolts, volts, millivolts, microvolts
    // ElectricResistance
    case megaohms, kiloohms, ohms, milliohms, microohms
    // Energy
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours
    // Frequency
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond
    // FuelEfficiency
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon
    // Data
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits

    /// The unit type of the unit.
    /// 单位的类型。
    public var unitType: AUnitType {
        switch self {
        case .feet, .nauticalMiles, .meters, .kilometers, .miles, .megameters, .hectometers, .decameters, .decimeters, .centimeters, .millimeters, .micrometers, .nanometers, .picometers, .inches, .yards, .scandinavianMiles, .lightyears, .fathoms, .furlongs, .astronomicalUnits, .parsecs:
            return .length
        case .feetPerSecond, .knots, .kilometersPerHour, .metersPerSecond, .milesPerHour, .feetPerMinute, .inchesPerSecond, .yardsPerSecond:
            return .speed
        case .hectopascals, .inchesOfMercury, .millimetersOfMercury, .newtonsPerMetersSquared, .gigapascals, .megapascals, .kilopascals, .bars, .millibars, .poundsForcePerSquareInch:
            return .pressure
        case .kelvin, .celsius, .fahrenheit, .rankine:
            return .temperature
        case .celsiusDelta, .fahrenheitDelta:
            return .temperatureDifference
        case .kilograms, .grams, .decigrams, .centigrams, .milligrams, .micrograms, .nanograms, .picograms, .ounces, .pounds, .stones, .metricTons, .shortTons, .carats, .ouncesTroy, .slugs, .kilopounds:
            return .mass
        case .liters, .quarts, .cubicMeters, .cubicCentimeters, .gallons, .megaliters, .kiloliters, .deciliters, .centiliters, .milliliters, .cubicKilometers, .cubicDecimeters, .cubicMillimeters, .cubicInches, .cubicFeet, .cubicYards, .cubicMiles, .acreFeet, .bushels, .teaspoons, .tablespoons, .fluidOunces, .cups, .pints, .imperialTeaspoons, .imperialTablespoons, .imperialFluidOunces, .imperialPints, .imperialQuarts, .imperialGallons, .metricCups:
            return .volume
        case .metersPerSecondSquared, .gravity:
            return .acceleration
        case .terawatts, .gigawatts, .megawatts, .kilowatts, .watts, .milliwatts, .microwatts, .nanowatts, .picowatts, .femtowatts, .horsepower:
            return .power
        case .degrees, .arcMinutes, .arcSeconds, .radians, .gradians, .revolutions:
            return .angle
        case .radiansPerSecond, .degreesPerSecond, .revolutionsPerMinute, .revolutionsPerSecond:
            return .angularVelocity
        case .squareMegameters, .squareKilometers, .squareMeters, .squareCentimeters, .squareMillimeters, .squareMicrometers, .squareNanometers, .squareInches, .squareFeet, .squareYards, .squareMiles, .acres, .ares, .hectares:
            return .area
        case .gramsPerLiter, .milligramsPerDeciliter, .partsPerMillion:
            return .concentration
        case .hours, .minutes, .seconds, .milliseconds, .microseconds, .nanoseconds, .picoseconds, .days, .weeks, .years, .decades, .centuries:
            return .time
        case .megaampereHours, .kiloampereHours, .ampereHours, .milliampereHours, .microampereHours, .ampereSeconds:
            return .electricChargeCapacity
        case .megaamperes, .kiloamperes, .amperes, .milliamperes, .microamperes:
            return .electricCurrent
        case .megavolts, .kilovolts, .volts, .millivolts, .microvolts:
            return .electricPotential
        case .megaohms, .kiloohms, .ohms, .milliohms, .microohms:
            return .electricResistance
        case .kilojoules, .joules, .kilocalories, .calories, .kilowattHours, .wattHours:
            return .energy
        case .terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz, .framesPerSecond:
            return .frequency
        case .litersPer100Kilometers, .milesPerImperialGallon, .milesPerGallon:
            return .fuelEfficiency
        case .bytes, .bits, .nibbles, .yottabytes, .zettabytes, .exabytes, .petabytes, .terabytes, .gigabytes, .megabytes, .kilobytes, .yottabits, .zettabits, .exabits, .petabits, .terabits, .gigabits, .megabits, .kilobits, .yobibytes, .zebibytes, .exbibytes, .pebibytes, .tebibytes, .gibibytes, .mebibytes, .kibibytes, .yobibits, .zebibits, .exbibits, .pebibits, .tebibits, .gibibits, .mebibits, .kibibits:
            return .data
        }
    }

    public var id: AUnit { self }

    /// The coefficient for conversion.
    /// 转换系数。
    public var coefficient: Double {
        switch self {
        // Length
        case .feet: return 3.048e-1
        case .nauticalMiles: return 1.852e3
        case .meters: return 1
        case .kilometers: return 1e3
        case .miles: return 1.609344e3
        case .megameters: return 1e6
        case .hectometers: return 1e2
        case .decameters: return 1e1
        case .decimeters: return 1e-1
        case .centimeters: return 1e-2
        case .millimeters: return 1e-3
        case .micrometers: return 1e-6
        case .nanometers: return 1e-9
        case .picometers: return 1e-12
        case .inches: return 2.54e-2
        case .yards: return 9.144e-1
        case .scandinavianMiles: return 1e4
        case .lightyears: return 9.4607304725808e15
        case .fathoms: return 1.8288
        case .furlongs: return 2.01168e2
        case .astronomicalUnits: return 1.495978707e11
        case .parsecs: return 3.085677581467191e16
        // Speed
        case .feetPerSecond: return 3.048e-1
        case .knots: return 5.14444e-1
        case .kilometersPerHour: return 2.777777777777778e-1
        case .metersPerSecond: return 1
        case .milesPerHour: return 4.4704e-1
        case .feetPerMinute: return 5.08e-3
        case .inchesPerSecond: return 2.54e-2
        case .yardsPerSecond: return 9.144e-1
        // Pressure
        case .hectopascals: return 1e2
        case .inchesOfMercury: return 3.386388157894736e3
        case .millimetersOfMercury: return 1.33322e2
        case .newtonsPerMetersSquared: return 1
        case .gigapascals: return 1e9
        case .megapascals: return 1e6
        case .kilopascals: return 1e3
        case .bars: return 1e5
        case .millibars: return 1e2
        case .poundsForcePerSquareInch: return 6.894757293168361e3
        // Temperature
        case .kelvin: return 1
        case .celsius: return 1
        case .fahrenheit: return 5.555555555555556e-1
        case .rankine: return 5.555555555555556e-1
        // TemperatureDifference
        case .celsiusDelta: return 1
        case .fahrenheitDelta: return 5.555555555555556e-1
        // Mass
        case .kilograms: return 1
        case .grams: return 1e-3
        case .decigrams: return 1e-4
        case .centigrams: return 1e-5
        case .milligrams: return 1e-6
        case .micrograms: return 1e-9
        case .nanograms: return 1e-12
        case .picograms: return 1e-15
        case .ounces: return 2.8349523125e-2
        case .pounds: return 4.5359237e-1
        case .stones: return 6.35029318
        case .metricTons: return 1e3
        case .shortTons: return 9.0718474e2
        case .carats: return 2e-4
        case .ouncesTroy: return 3.11034768e-2
        case .slugs: return 1.4593902937206e1
        case .kilopounds: return 4.5359237e2
        // Volume
        case .liters: return 1
        case .quarts: return 9.46352946e-1
        case .cubicMeters: return 1e3
        case .cubicCentimeters: return 1e-3
        case .gallons: return 3.785411784
        case .megaliters: return 1e6
        case .kiloliters: return 1e3
        case .deciliters: return 1e-1
        case .centiliters: return 1e-2
        case .milliliters: return 1e-3
        case .cubicKilometers: return 1e12
        case .cubicDecimeters: return 1
        case .cubicMillimeters: return 1e-6
        case .cubicInches: return 1.6387064e-2
        case .cubicFeet: return 2.8316846592e1
        case .cubicYards: return 7.64554857984e2
        case .cubicMiles: return 4.16818182544e12
        case .acreFeet: return 1.23348183754752e3
        case .bushels: return 3.523907016688e1
        case .teaspoons: return 4.92892159375e-3
        case .tablespoons: return 1.478676478125e-2
        case .fluidOunces: return 2.95735295625e-2
        case .cups: return 2.4e-1
        case .pints: return 4.73176473e-1
        case .imperialTeaspoons: return 5.919388020833e-3
        case .imperialTablespoons: return 1.77581640625e-2
        case .imperialFluidOunces: return 2.84130625e-2
        case .imperialPints: return 5.6826125e-1
        case .imperialQuarts: return 1.1365225
        case .imperialGallons: return 4.54609
        case .metricCups: return 2.5e-1
        // Acceleration
        case .metersPerSecondSquared: return 1
        case .gravity: return 9.80665
        // Power
        case .terawatts: return 1e12
        case .gigawatts: return 1e9
        case .megawatts: return 1e6
        case .kilowatts: return 1e3
        case .watts: return 1
        case .milliwatts: return 1e-3
        case .microwatts: return 1e-6
        case .nanowatts: return 1e-9
        case .picowatts: return 1e-12
        case .femtowatts: return 1e-15
        case .horsepower: return 7.456998715822702e2
        // Angle
        case .degrees: return 1
        case .arcMinutes: return 1.666666666666667e-2
        case .arcSeconds: return 2.777777777777778e-4
        case .radians: return 5.729577951308232e1
        case .gradians: return 9e-1
        case .revolutions: return 3.6e2
        // Angular Velocity
        case .radiansPerSecond: return 1
        case .degreesPerSecond: return 1.745329251994329e-2
        case .revolutionsPerMinute: return 1.047197551196598e-1
        case .revolutionsPerSecond: return 6.283185307179586
        // Area
        case .squareMegameters: return 1e12
        case .squareKilometers: return 1e6
        case .squareMeters: return 1
        case .squareCentimeters: return 1e-4
        case .squareMillimeters: return 1e-6
        case .squareMicrometers: return 1e-12
        case .squareNanometers: return 1e-18
        case .squareInches: return 6.4516e-4
        case .squareFeet: return 9.290304e-2
        case .squareYards: return 8.3612736e-1
        case .squareMiles: return 2.589988110336e6
        case .acres: return 4.046856e3
        case .ares: return 1e2
        case .hectares: return 1e4
        // Concentration
        case .gramsPerLiter: return 1
        case .milligramsPerDeciliter: return 1e-2
        case .partsPerMillion: return 1e-6
        // Time
        case .hours: return 3.6e3
        case .minutes: return 6e1
        case .seconds: return 1
        case .milliseconds: return 1e-3
        case .microseconds: return 1e-6
        case .nanoseconds: return 1e-9
        case .picoseconds: return 1e-12
        case .days: return 8.64e4
        case .weeks: return 6.048e5
        case .years: return 3.15576e7 // 考虑闰年的平均值
        case .decades: return 3.15576e8
        case .centuries: return 3.15576e9
        // ElectricChargeCapacity
        case .megaampereHours: return 3.6e9
        case .kiloampereHours: return 3.6e6
        case .ampereHours: return 3.6e3
        case .milliampereHours: return 3.6
        case .microampereHours: return 3.6e-3
        case .ampereSeconds: return 1
        // ElectricCurrent
        case .megaamperes: return 1e6
        case .kiloamperes: return 1e3
        case .amperes: return 1
        case .milliamperes: return 1e-3
        case .microamperes: return 1e-6
        // ElectricPotential
        case .megavolts: return 1e6
        case .kilovolts: return 1e3
        case .volts: return 1
        case .millivolts: return 1e-3
        case .microvolts: return 1e-6
        // ElectricResistance
        case .megaohms: return 1e6
        case .kiloohms: return 1e3
        case .ohms: return 1
        case .milliohms: return 1e-3
        case .microohms: return 1e-6
        // Energy
        case .kilojoules: return 1e3
        case .joules: return 1
        case .kilocalories: return 4.184e3
        case .calories: return 4.184
        case .kilowattHours: return 3.6e6
        case .wattHours: return 3.6e3
        // Frequency
        case .terahertz: return 1e12
        case .gigahertz: return 1e9
        case .megahertz: return 1e6
        case .kilohertz: return 1e3
        case .hertz: return 1
        case .millihertz: return 1e-3
        case .microhertz: return 1e-6
        case .nanohertz: return 1e-9
        case .framesPerSecond: return 1
        // FuelEfficiency
        case .litersPer100Kilometers: return 1
        case .milesPerImperialGallon: return 3.54006e-1
        case .milesPerGallon: return 4.25144e-1
        // Data
        case .bytes: return 1
        case .bits: return 1.25e-1
        case .nibbles: return 5e-1
        case .yottabytes: return 1.208925819614629e24
        case .zettabytes: return 1.180591620717411e21
        case .exabytes: return 1.152921504606847e18
        case .petabytes: return 1.125899906842624e15
        case .terabytes: return 1.099511627776e12
        case .gigabytes: return 1.073741824e9
        case .megabytes: return 1.048576e6
        case .kilobytes: return 1.024e3
        case .yottabits: return 1.511157274518286e23
        case .zettabits: return 1.475739525896764e20
        case .exabits: return 1.441151880758559e17
        case .petabits: return 1.40737488355328e14
        case .terabits: return 1.37438953472e11
        case .gigabits: return 1.34217728e8
        case .megabits: return 1.048576e6
        case .kilobits: return 1.28e2
        case .yobibytes: return 1.208925819614629e24
        case .zebibytes: return 1.180591620717411e21
        case .exbibytes: return 1.152921504606847e18
        case .pebibytes: return 1.125899906842624e15
        case .tebibytes: return 1.099511627776e12
        case .gibibytes: return 1.073741824e9
        case .mebibytes: return 1.048576e6
        case .kibibytes: return 1.024e3
        case .yobibits: return 1.511157274518286e23
        case .zebibits: return 1.475739525896764e20
        case .exbibits: return 1.441151880758559e17
        case .pebibits: return 1.40737488355328e14
        case .tebibits: return 1.37438953472e11
        case .gibibits: return 1.34217728e8
        case .mebibits: return 1.048576e6
        case .kibibits: return 1.28e2
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .kelvin: return 0
        case .celsius: return 2.7315e2
        case .fahrenheit: return 4.5967e2
        case .rankine: return 0
        default: return 0
        }
    }

    /// The symbol for the unit.
    /// 单位的符号。
    /// 尽可能一个字/词
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit.
    /// 单位的短名称。
    /// 例如 米/秒
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit.
    /// 单位的全名称。
    /// 例如 米每秒
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit.
    /// 单位的详细介绍。
    public var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// Converts a value from this unit to another unit.
    /// 将值从此单位转换为另一单位。
    /// - Parameters:
    ///   - value: The value to convert.
    ///   - unit: The target unit.
    /// - Returns: The converted value, or nil if conversion is not possible.
    public func convert(value: Double, to unit: AUnit) -> Double? {
        guard self.unitType == unit.unitType else { return nil }
        // Temperature conversion
        if self.unitType == .temperature && unit.unitType == .temperature {
            let valueInKelvin = (value + self.constant) * self.coefficient
            return (valueInKelvin / unit.coefficient) - unit.constant
        } else if self.unitType == .temperatureDifference && unit.unitType == .temperatureDifference {
            return value * self.coefficient / unit.coefficient
        }
        // Other unit conversion
        let valueInBaseUnit = value * self.coefficient
        return valueInBaseUnit / unit.coefficient
    }
}
