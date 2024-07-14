import Foundation

/// Enum representing various units.
/// 表示各种单位的枚举。
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
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
        case .feet: return 0.3048
        case .nauticalMiles: return 1_852.0
        case .meters: return 1.0
        case .kilometers: return 1_000.0
        case .miles: return 1_609.344
        case .megameters: return 1_000_000.0
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1e-6
        case .nanometers: return 1e-9
        case .picometers: return 1e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 10_000.0
        case .lightyears: return 9.4607e15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 1.496e11
        case .parsecs: return 3.0857e16
        // Speed
        case .feetPerSecond: return 0.3048
        case .knots: return 0.514444
        case .kilometersPerHour: return 0.277778
        case .metersPerSecond: return 1.0
        case .milesPerHour: return 0.44704
        case .feetPerMinute: return 0.00508
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        // Pressure
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3_386.39
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1e9
        case .megapascals: return 1e6
        case .kilopascals: return 1_000.0
        case .bars: return 100_000.0
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6_894.76
        // Temperature
        case .kelvin: return 1.0
        case .celsius: return 1.0
        case .fahrenheit: return 5.0 / 9.0
        case .rankine: return 5.0 / 9.0
        // TemperatureDifference
        case .celsiusDelta: return 1.0
        case .fahrenheitDelta: return 5.0 / 9.0
        // Mass
        case .kilograms: return 1.0
        case .grams: return 0.001
        case .decigrams: return 0.0001
        case .centigrams: return 0.00001
        case .milligrams: return 1e-6
        case .micrograms: return 1e-9
        case .nanograms: return 1e-12
        case .picograms: return 1e-15
        case .ounces: return 0.0283495
        case .pounds: return 0.453592
        case .stones: return 6.35029
        case .metricTons: return 1_000.0
        case .shortTons: return 907.185
        case .carats: return 0.0002
        case .ouncesTroy: return 0.0311035
        case .slugs: return 14.5939
        case .kilopounds: return 453.592
        // Volume
        case .liters: return 1.0
        case .quarts: return 0.946353
        case .cubicMeters: return 1_000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.78541
        case .megaliters: return 1_000_000.0
        case .kiloliters: return 1_000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1e12
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1e-6
        case .cubicInches: return 0.0163871
        case .cubicFeet: return 28.3168
        case .cubicYards: return 764.555
        case .cubicMiles: return 4.168e12
        case .acreFeet: return 1_233.48
        case .bushels: return 35.2391
        case .teaspoons: return 0.00492892
        case .tablespoons: return 0.0147868
        case .fluidOunces: return 0.0295735
        case .cups: return 0.24
        case .pints: return 0.473176
        case .imperialTeaspoons: return 0.00591939
        case .imperialTablespoons: return 0.0177582
        case .imperialFluidOunces: return 0.0284131
        case .imperialPints: return 0.568261
        case .imperialQuarts: return 1.13652
        case .imperialGallons: return 4.54609
        case .metricCups: return 0.25
        // Acceleration
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        // Power
        case .terawatts: return 1e12
        case .gigawatts: return 1e9
        case .megawatts: return 1e6
        case .kilowatts: return 1_000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1e-6
        case .nanowatts: return 1e-9
        case .picowatts: return 1e-12
        case .femtowatts: return 1e-15
        case .horsepower: return 745.7
        // Angle
        case .degrees: return 1.0
        case .arcMinutes: return 1.0 / 60.0
        case .arcSeconds: return 1.0 / 3_600.0
        case .radians: return 180.0 / .pi
        case .gradians: return 0.9
        case .revolutions: return 360.0
        // Angular Velocity
        case .radiansPerSecond: return 1.0
        case .degreesPerSecond: return .pi / 180.0
        case .revolutionsPerMinute: return .pi / 30.0
        case .revolutionsPerSecond: return 2 * .pi
        // Area
        case .squareMegameters: return 1e12
        case .squareKilometers: return 1_000_000.0
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1e-6
        case .squareMicrometers: return 1e-12
        case .squareNanometers: return 1e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.092903
        case .squareYards: return 0.836127
        case .squareMiles: return 2_589_988.11
        case .acres: return 4_046.856
        case .ares: return 100.0
        case .hectares: return 10_000.0
        // Concentration
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1e-6
        // Time
        case .hours: return 3_600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1e-6
        case .nanoseconds: return 1e-9
        case .picoseconds: return 1e-12
        case .days: return 86_400.0
        case .weeks: return 604_800.0
        case .years: return 31_557_600.0 // 考虑闰年的平均值
        case .decades: return 315_576_000.0
        case .centuries: return 3_155_760_000.0
        // ElectricChargeCapacity
        case .megaampereHours: return 3.6e9
        case .kiloampereHours: return 3.6e6
        case .ampereHours: return 3_600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .ampereSeconds: return 1.0
        // ElectricCurrent
        case .megaamperes: return 1e6
        case .kiloamperes: return 1_000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1e-6
        // ElectricPotential
        case .megavolts: return 1e6
        case .kilovolts: return 1_000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1e-6
        // ElectricResistance
        case .megaohms: return 1e6
        case .kiloohms: return 1_000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1e-6
        // Energy
        case .kilojoules: return 1_000.0
        case .joules: return 1.0
        case .kilocalories: return 4_184.0
        case .calories: return 4.184
        case .kilowattHours: return 3.6e6
        case .wattHours: return 3_600.0
        // Frequency
        case .terahertz: return 1e12
        case .gigahertz: return 1e9
        case .megahertz: return 1e6
        case .kilohertz: return 1_000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1e-6
        case .nanohertz: return 1e-9
        case .framesPerSecond: return 1.0
        // FuelEfficiency
        case .litersPer100Kilometers: return 1.0
        case .milesPerImperialGallon: return 0.354006
        case .milesPerGallon: return 0.425144
        // Data
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1.2089258196146292e24
        case .zettabytes: return 1.1805916207174113e21
        case .exabytes: return 1.152921504606847e18
        case .petabytes: return 1.125899906842624e15
        case .terabytes: return 1.099511627776e12
        case .gigabytes: return 1.073741824e9
        case .megabytes: return 1.048576e6
        case .kilobytes: return 1_024.0
        case .yottabits: return 1.5111572745182865e23
        case .zettabits: return 1.475739525896764e20
        case .exabits: return 1.4411518807585588e17
        case .petabits: return 1.40737488355328e14
        case .terabits: return 1.37438953472e11
        case .gigabits: return 1.34217728e8
        case .megabits: return 1_048_576.0
        case .kilobits: return 1_024.0 / 8.0
        case .yobibytes: return 1.2089258196146292e24
        case .zebibytes: return 1.1805916207174113e21
        case .exbibytes: return 1.152921504606847e18
        case .pebibytes: return 1.125899906842624e15
        case .tebibytes: return 1.099511627776e12
        case .gibibytes: return 1.073741824e9
        case .mebibytes: return 1.048576e6
        case .kibibytes: return 1_024.0
        case .yobibits: return 1.5111572745182865e23
        case .zebibits: return 1.475739525896764e20
        case .exbibits: return 1.4411518807585588e17
        case .pebibits: return 1.40737488355328e14
        case .tebibits: return 1.37438953472e11
        case .gibibits: return 1.34217728e8
        case .mebibits: return 1_048_576.0
        case .kibibits: return 1_024.0 / 8.0
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .kelvin: return 0.0
        case .celsius: return 273.15
        case .fahrenheit: return 459.67
        case .rankine: return 0.0
        default: return 0.0
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
