// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum AUnit: Codable, Sendable, Hashable, CaseIterable {
    // 加速度单位
    case metersPerSecondSquared, gravity

    // 角度单位
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions

    // 面积单位
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares

    // 浓度单位
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion

    // 时间单位
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds

    // 电量单位
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours

    // 电流单位
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes

    // 电压单位
    case megavolts, kilovolts, volts, millivolts, microvolts

    // 电阻单位
    case megaohms, kiloohms, ohms, milliohms, microohms

    // 能量单位
    case kilojoules, joules, kilocalories, calories, kilowattHours

    // 频率单位
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond

    // 燃油效率单位
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon

    // 数据单位
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits

    // 长度单位
    case nauticalMiles, kilometers, meters, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, feet, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs

    // 质量单位
    case kilograms, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, ounces, pounds, stones, metricTons, shortTons, carats, ouncesTroy, slugs

    // 功率单位
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower

    // 压力单位
    case newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, hectopascals, inchesOfMercury, bars, millibars, millimetersOfMercury, poundsForcePerSquareInch

    // 速度单位
    case knots, kilometersPerHour, metersPerSecond, milesPerHour, feetPerSecond, feetPerMinute

    // 温度单位
    case kelvin, celsius, fahrenheit

    // 体积单位
    case liters, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, quarts, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups

    // 计算属性
    var unitType: AUnitType {
        switch self {
        case .metersPerSecondSquared, .gravity:
            return .acceleration
        case .degrees, .arcMinutes, .arcSeconds, .radians, .gradians, .revolutions:
            return .angle
        case .squareMegameters, .squareKilometers, .squareMeters, .squareCentimeters, .squareMillimeters, .squareMicrometers, .squareNanometers, .squareInches, .squareFeet, .squareYards, .squareMiles, .acres, .ares, .hectares:
            return .area
        case .gramsPerLiter, .milligramsPerDeciliter, .partsPerMillion:
            return .concentration
        case .hours, .minutes, .seconds, .milliseconds, .microseconds, .nanoseconds, .picoseconds:
            return .time
        case .megaampereHours, .kiloampereHours, .ampereHours, .milliampereHours, .microampereHours:
            return .electricChargeCapacity
        case .megaamperes, .kiloamperes, .amperes, .milliamperes, .microamperes:
            return .electricCurrent
        case .megavolts, .kilovolts, .volts, .millivolts, .microvolts:
            return .electricPotential
        case .megaohms, .kiloohms, .ohms, .milliohms, .microohms:
            return .electricResistance
        case .kilojoules, .joules, .kilocalories, .calories, .kilowattHours:
            return .energy
        case .terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz, .framesPerSecond:
            return .frequency
        case .litersPer100Kilometers, .milesPerImperialGallon, .milesPerGallon:
            return .fuelEfficiency
        case .bytes, .bits, .nibbles, .yottabytes, .zettabytes, .exabytes, .petabytes, .terabytes, .gigabytes, .megabytes, .kilobytes, .yottabits, .zettabits, .exabits, .petabits, .terabits, .gigabits, .megabits, .kilobits, .yobibytes, .zebibytes, .exbibytes, .pebibytes, .tebibytes, .gibibytes, .mebibytes, .kibibytes, .yobibits, .zebibits, .exbibits, .pebibits, .tebibits, .gibibits, .mebibits, .kibibits:
            return .data
        case .nauticalMiles, .kilometers, .meters, .miles, .megameters, .hectometers, .decameters, .decimeters, .centimeters, .millimeters, .micrometers, .nanometers, .picometers, .inches, .feet, .yards, .scandinavianMiles, .lightyears, .fathoms, .furlongs, .astronomicalUnits, .parsecs:
            return .length
        case .kilograms, .grams, .decigrams, .centigrams, .milligrams, .micrograms, .nanograms, .picograms, .ounces, .pounds, .stones, .metricTons, .shortTons, .carats, .ouncesTroy, .slugs:
            return .mass
        case .terawatts, .gigawatts, .megawatts, .kilowatts, .watts, .milliwatts, .microwatts, .nanowatts, .picowatts, .femtowatts, .horsepower:
            return .power
        case .newtonsPerMetersSquared, .gigapascals, .megapascals, .kilopascals, .hectopascals, .inchesOfMercury, .bars, .millibars, .millimetersOfMercury, .poundsForcePerSquareInch:
            return .pressure
        case .knots, .kilometersPerHour, .metersPerSecond, .milesPerHour, .feetPerSecond, .feetPerMinute:
            return .speed
        case .kelvin, .celsius, .fahrenheit:
            return .temperature
        case .liters, .cubicMeters, .cubicCentimeters, .gallons, .megaliters, .kiloliters, .deciliters, .centiliters, .milliliters, .cubicKilometers, .cubicDecimeters, .cubicMillimeters, .cubicInches, .cubicFeet, .cubicYards, .cubicMiles, .acreFeet, .bushels, .teaspoons, .tablespoons, .fluidOunces, .cups, .pints, .quarts, .imperialTeaspoons, .imperialTablespoons, .imperialFluidOunces, .imperialPints, .imperialQuarts, .imperialGallons, .metricCups:
            return .volume
        }
    }

    // 计算属性 - 系数
    var coefficient: Double {
        switch self {
        // 加速度单位
        case .metersPerSecondSquared:
            return 1.0
        case .gravity:
            return 9.80665

        // 角度单位
        case .degrees:
            return 1.0
        case .arcMinutes:
            return 1.0 / 60.0
        case .arcSeconds:
            return 1.0 / 3600.0
        case .radians:
            return 180.0 / .pi
        case .gradians:
            return 0.9
        case .revolutions:
            return 360.0

        // 面积单位
        case .squareMegameters:
            return 1e12
        case .squareKilometers:
            return 1e6
        case .squareMeters:
            return 1.0
        case .squareCentimeters:
            return 1e-4
        case .squareMillimeters:
            return 1e-6
        case .squareMicrometers:
            return 1e-12
        case .squareNanometers:
            return 1e-18
        case .squareInches:
            return 0.00064516
        case .squareFeet:
            return 0.092903
        case .squareYards:
            return 0.83612736
        case .squareMiles:
            return 2.589988110336e6
        case .acres:
            return 4046.8564224
        case .ares:
            return 100.0
        case .hectares:
            return 1e4

        // 浓度单位
        case .gramsPerLiter:
            return 1.0
        case .milligramsPerDeciliter:
            return 0.01
        case .partsPerMillion:
            return 1e-6

        // 时间单位
        case .hours:
            return 3600.0
        case .minutes:
            return 60.0
        case .seconds:
            return 1.0
        case .milliseconds:
            return 1e-3
        case .microseconds:
            return 1e-6
        case .nanoseconds:
            return 1e-9
        case .picoseconds:
            return 1e-12

        // 电量单位
        case .megaampereHours:
            return 3.6e9
        case .kiloampereHours:
            return 3.6e6
        case .ampereHours:
            return 3600.0
        case .milliampereHours:
            return 3.6
        case .microampereHours:
            return 0.0036

        // 电流单位
        case .megaamperes:
            return 1e6
        case .kiloamperes:
            return 1e3
        case .amperes:
            return 1.0
        case .milliamperes:
            return 1e-3
        case .microamperes:
            return 1e-6

        // 电压单位
        case .megavolts:
            return 1e6
        case .kilovolts:
            return 1e3
        case .volts:
            return 1.0
        case .millivolts:
            return 1e-3
        case .microvolts:
            return 1e-6

        // 电阻单位
        case .megaohms:
            return 1e6
        case .kiloohms:
            return 1e3
        case .ohms:
            return 1.0
        case .milliohms:
            return 1e-3
        case .microohms:
            return 1e-6

        // 能量单位
        case .kilojoules:
            return 1e3
        case .joules:
            return 1.0
        case .kilocalories:
            return 4184.0
        case .calories:
            return 4.184
        case .kilowattHours:
            return 3.6e6

        // 频率单位
        case .terahertz:
            return 1e12
        case .gigahertz:
            return 1e9
        case .megahertz:
            return 1e6
        case .kilohertz:
            return 1e3
        case .hertz:
            return 1.0
        case .millihertz:
            return 1e-3
        case .microhertz:
            return 1e-6
        case .nanohertz:
            return 1e-9
        case .framesPerSecond:
            return 1.0

        // 燃油效率单位
        case .litersPer100Kilometers:
            return 1.0
        case .milesPerImperialGallon:
            return 1.0
        case .milesPerGallon:
            return 1.0

        // 数据单位
        case .bytes:
            return 1.0
        case .bits:
            return 0.125
        case .nibbles:
            return 0.5
        case .yottabytes:
            return 1e24
        case .zettabytes:
            return 1e21
        case .exabytes:
            return 1e18
        case .petabytes:
            return 1e15
        case .terabytes:
            return 1e12
        case .gigabytes:
            return 1e9
        case .megabytes:
            return 1e6
        case .kilobytes:
            return 1e3
        case .yottabits:
            return 1.25e23
        case .zettabits:
            return 1.25e20
        case .exabits:
            return 1.25e17
        case .petabits:
            return 1.25e14
        case .terabits:
            return 1.25e11
        case .gigabits:
            return 1.25e8
        case .megabits:
            return 1.25e5
        case .kilobits:
            return 125.0
        case .yobibytes:
            return 1.2089258196146292e24
        case .zebibytes:
            return 1.1805916207174113e21
        case .exbibytes:
            return 1.152921504606847e18
        case .pebibytes:
            return 1.125899906842624e15
        case .tebibytes:
            return 1.099511627776e12
        case .gibibytes:
            return 1.073741824e9
        case .mebibytes:
            return 1.048576e6
        case .kibibytes:
            return 1024.0
        case .yobibits:
            return 1.2089258196146292e24 / 8.0
        case .zebibits:
            return 1.1805916207174113e21 / 8.0
        case .exbibits:
            return 1.152921504606847e18 / 8.0
        case .pebibits:
            return 1.125899906842624e15 / 8.0
        case .tebibits:
            return 1.099511627776e12 / 8.0
        case .gibibits:
            return 1.073741824e9 / 8.0
        case .mebibits:
            return 1.048576e6 / 8.0
        case .kibibits:
            return 1024.0 / 8.0

        // 长度单位
        case .nauticalMiles:
            return 1852.0
        case .kilometers:
            return 1e3
        case .meters:
            return 1.0
        case .miles:
            return 1609.344
        case .megameters:
            return 1e6
        case .hectometers:
            return 1e2
        case .decameters:
            return 10.0
        case .decimeters:
            return 0.1
        case .centimeters:
            return 0.01
        case .millimeters:
            return 0.001
        case .micrometers:
            return 1e-6
        case .nanometers:
            return 1e-9
        case .picometers:
            return 1e-12
        case .inches:
            return 0.0254
        case .feet:
            return 0.3048
        case .yards:
            return 0.9144
        case .scandinavianMiles:
            return 1e4
        case .lightyears:
            return 9.4607304725808e15
        case .fathoms:
            return 1.8288
        case .furlongs:
            return 201.168
        case .astronomicalUnits:
            return 1.495978707e11
        case .parsecs:
            return 3.085677581e16

        // 质量单位
        case .kilograms:
            return 1.0
        case .grams:
            return 0.001
        case .decigrams:
            return 0.0001
        case .centigrams:
            return 0.00001
        case .milligrams:
            return 1e-6
        case .micrograms:
            return 1e-9
        case .nanograms:
            return 1e-12
        case .picograms:
            return 1e-15
        case .ounces:
            return 0.028349523125
        case .pounds:
            return 0.45359237
        case .stones:
            return 6.35029318
        case .metricTons:
            return 1e3
        case .shortTons:
            return 907.18474
        case .carats:
            return 0.0002
        case .ouncesTroy:
            return 0.0311034768
        case .slugs:
            return 14.5939029372

        // 功率单位
        case .terawatts:
            return 1e12
        case .gigawatts:
            return 1e9
        case .megawatts:
            return 1e6
        case .kilowatts:
            return 1e3
        case .watts:
            return 1.0
        case .milliwatts:
            return 1e-3
        case .microwatts:
            return 1e-6
        case .nanowatts:
            return 1e-9
        case .picowatts:
            return 1e-12
        case .femtowatts:
            return 1e-15
        case .horsepower:
            return 745.69987158227

        // 压力单位
        case .newtonsPerMetersSquared:
            return 1.0
        case .gigapascals:
            return 1e9
        case .megapascals:
            return 1e6
        case .kilopascals:
            return 1e3
        case .hectopascals:
            return 1e2
        case .inchesOfMercury:
            return 3386.39
        case .bars:
            return 1e5
        case .millibars:
            return 1e2
        case .millimetersOfMercury:
            return 133.322
        case .poundsForcePerSquareInch:
            return 6894.76

        // 速度单位
        case .knots:
            return 0.514444444444444
        case .kilometersPerHour:
            return 0.277777777777778
        case .metersPerSecond:
            return 1.0
        case .milesPerHour:
            return 0.44704
        case .feetPerSecond:
            return 0.3048
        case .feetPerMinute:
            return 0.00508

        // 温度单位
        case .kelvin:
            return 1.0
        case .celsius:
            return 1.0
        case .fahrenheit:
            return 1.0

        // 体积单位
        case .liters:
            return 1.0
        case .cubicMeters:
            return 1.0
        case .cubicCentimeters:
            return 1e-6
        case .gallons:
            return 3.785411784
        case .megaliters:
            return 1e6
        case .kiloliters:
            return 1e3
        case .deciliters:
            return 0.1
        case .centiliters:
            return 0.01
        case .milliliters:
            return 1e-3
        case .cubicKilometers:
            return 1e12
        case .cubicDecimeters:
            return 1e-3
        case .cubicMillimeters:
            return 1e-9
        case .cubicInches:
            return 0.016387064
        case .cubicFeet:
            return 0.028316846592
        case .cubicYards:
            return 0.764554857984
        case .cubicMiles:
            return 4.168181825440576e14
        case .acreFeet:
            return 1233.48183754752
        case .bushels:
            return 0.03523907016688
        case .teaspoons:
            return 0.004928921593775
        case .tablespoons:
            return 0.014786764781325
        case .fluidOunces:
            return 0.0295735295625
        case .cups:
            return 0.24
        case .pints:
            return 0.473176473
        case .quarts:
            return 0.946352946
        case .imperialTeaspoons:
            return 0.005919388020833
        case .imperialTablespoons:
            return 0.0177581640625
        case .imperialFluidOunces:
            return 0.0284130625
        case .imperialPints:
            return 0.56826125
        case .imperialQuarts:
            return 1.1365225
        case .imperialGallons:
            return 4.54609
        case .metricCups:
            return 0.25
        }
    }

    // 计算属性 - 常数
    var constant: Double {
        switch self {
        // 温度单位
        case .kelvin:
            return 0.0
        case .celsius:
            return 273.15
        case .fahrenheit:
            return 255.372222222222

        // 其他单位的常数为 0
        default:
            return 0.0
        }
    }

    // 单位换算方法
    func convert(value: Double, to unit: AUnit) -> Double? {
        guard self.unitType == unit.unitType else { return nil }

        // 温度单位换算
        if self.unitType == .temperature && unit.unitType == .temperature {
            let valueInKelvin = (value * self.coefficient) + self.constant
            return (valueInKelvin - unit.constant) / unit.coefficient
        }

        // 其他单位换算
        let valueInBaseUnit = value * self.coefficient
        return valueInBaseUnit / unit.coefficient
    }
}

public enum AUnitType: CaseIterable {
    case acceleration
    case angle
    case area
    case concentration
    case time
    case electricChargeCapacity
    case electricCurrent
    case electricPotential
    case electricResistance
    case energy
    case frequency
    case fuelEfficiency
    case data
    case length
    case mass
    case power
    case pressure
    case speed
    case temperature
    case volume
}
