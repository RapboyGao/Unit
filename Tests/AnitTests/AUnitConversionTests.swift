@testable import AUnit
import XCTest

final class AUnitConversionTests: XCTestCase {
    let epsilon = 1e-8 // 设定容忍度，增加精度

    /// 定义测试转换函数
    /// - Parameters:
    ///   - value: 测试值
    ///   - from: 起始单位
    ///   - to: 目标单位
    ///   - expected: 预期结果
    func assertConversion(_ value: Double, from: AUnit, to: AUnit, expected: Double) {
        let measurement = AMeasurement(value: value, unit: from)
        guard let converted = measurement.converted(to: to) else {
            XCTFail("Conversion from \(from) to \(to) failed.")
            return
        }
        XCTAssertEqual(converted.value, expected, accuracy: epsilon, "Conversion from \(from) to \(to) expected to be \(expected), but got \(converted.value)")
    }

    func testLengthConversions() throws {
        assertConversion(1, from: .feet, to: .meters, expected: 3.048e-1)
        assertConversion(1, from: .nauticalMiles, to: .meters, expected: 1.852e3)
        assertConversion(1, from: .meters, to: .kilometers, expected: 1e-3)
        assertConversion(1, from: .miles, to: .kilometers, expected: 1.609344e3)
        assertConversion(1, from: .inches, to: .centimeters, expected: 2.54e-2)
        assertConversion(1, from: .yards, to: .meters, expected: 9.144e-1)
        assertConversion(1, from: .lightyears, to: .kilometers, expected: 9.4607304725808e15)
        assertConversion(1, from: .parsecs, to: .lightyears, expected: 3.261563777141878)
        assertConversion(1, from: .fathoms, to: .meters, expected: 1.8288)
        assertConversion(1, from: .furlongs, to: .meters, expected: 2.01168e2)
        assertConversion(1, from: .astronomicalUnits, to: .kilometers, expected: 1.495978707e8)
    }

    func testSpeedConversions() throws {
        assertConversion(1, from: .knots, to: .metersPerSecond, expected: 5.14444e-1)
        assertConversion(1, from: .metersPerSecond, to: .kilometersPerHour, expected: 3.6)
        assertConversion(1, from: .milesPerHour, to: .kilometersPerHour, expected: 1.609344)
        assertConversion(1, from: .feetPerSecond, to: .metersPerSecond, expected: 3.048e-1)
        assertConversion(1, from: .feetPerMinute, to: .metersPerSecond, expected: 5.08e-3)
        assertConversion(1, from: .inchesPerSecond, to: .metersPerSecond, expected: 2.54e-2)
    }

    func testPressureConversions() throws {
        assertConversion(1, from: .hectopascals, to: .newtonsPerMetersSquared, expected: 1e2)
        assertConversion(1, from: .bars, to: .newtonsPerMetersSquared, expected: 1e5)
        assertConversion(1, from: .millibars, to: .newtonsPerMetersSquared, expected: 1e2)
        assertConversion(1, from: .poundsForcePerSquareInch, to: .newtonsPerMetersSquared, expected: 6.894757293168361e3)
        assertConversion(1, from: .inchesOfMercury, to: .newtonsPerMetersSquared, expected: 3.386388157894736e3)
        assertConversion(1, from: .millimetersOfMercury, to: .newtonsPerMetersSquared, expected: 1.33322e2)
    }

    func testTemperatureConversions() throws {
        assertConversion(0, from: .celsius, to: .kelvin, expected: 2.7315e2)
        assertConversion(0, from: .fahrenheit, to: .celsius, expected: -17.77777777777778)
        assertConversion(0, from: .kelvin, to: .celsius, expected: -2.7315e2)
        assertConversion(32, from: .fahrenheit, to: .celsius, expected: 0)
        assertConversion(100, from: .celsius, to: .fahrenheit, expected: 212)
        assertConversion(212, from: .fahrenheit, to: .celsius, expected: 100)
        assertConversion(1, from: .rankine, to: .kelvin, expected: 5.5555555555556e-1)
    }

    func testTemperatureDifferenceConversions() throws {
        assertConversion(1, from: .celsiusDelta, to: .fahrenheitDelta, expected: 1.8)
        assertConversion(1, from: .fahrenheitDelta, to: .celsiusDelta, expected: 5.555555555555556e-1)
    }

    func testMassConversions() throws {
        assertConversion(1, from: .kilograms, to: .grams, expected: 1e3)
        assertConversion(1, from: .grams, to: .milligrams, expected: 1e3)
        assertConversion(1, from: .metricTons, to: .kilograms, expected: 1e3)
        assertConversion(1, from: .pounds, to: .grams, expected: 4.5359237e2)
        assertConversion(1, from: .ounces, to: .grams, expected: 2.8349523125e1)
        assertConversion(1, from: .stones, to: .kilograms, expected: 6.35029318)
        assertConversion(1, from: .carats, to: .grams, expected: 2e-1)
        assertConversion(1, from: .ouncesTroy, to: .grams, expected: 3.11034768e1)
        assertConversion(1, from: .slugs, to: .kilograms, expected: 1.4593902937206e1)
        assertConversion(1, from: .kilopounds, to: .grams, expected: 4.5359237e5)
    }

    func testVolumeConversions() throws {
        assertConversion(1, from: .liters, to: .cubicMeters, expected: 1e-3)
        assertConversion(1, from: .gallons, to: .liters, expected: 3.785411784)
        assertConversion(1, from: .milliliters, to: .liters, expected: 1e-3)
        assertConversion(1, from: .cubicInches, to: .cubicCentimeters, expected: 1.6387064e1)
        assertConversion(1, from: .cubicFeet, to: .liters, expected: 2.8316846592e1)
        assertConversion(1, from: .cubicYards, to: .cubicMeters, expected: 7.64554857984e-1)
        assertConversion(1, from: .cubicMiles, to: .cubicKilometers, expected: 4.16818182544e3)
        assertConversion(1, from: .acreFeet, to: .cubicMeters, expected: 1.23348183754752e3)
        assertConversion(1, from: .bushels, to: .liters, expected: 3.523907016688e1)
        assertConversion(1, from: .teaspoons, to: .milliliters, expected: 4.92892159375e-3)
        assertConversion(1, from: .tablespoons, to: .milliliters, expected: 1.478676478125e-2)
        assertConversion(1, from: .fluidOunces, to: .milliliters, expected: 2.95735295625e-2)
        assertConversion(1, from: .cups, to: .liters, expected: 2.4e-1)
        assertConversion(1, from: .pints, to: .liters, expected: 4.73176473e-1)
        assertConversion(1, from: .imperialTeaspoons, to: .milliliters, expected: 5.919388020833e-3)
        assertConversion(1, from: .imperialTablespoons, to: .milliliters, expected: 1.77581640625e-2)
        assertConversion(1, from: .imperialFluidOunces, to: .milliliters, expected: 2.84130625e-2)
        assertConversion(1, from: .imperialPints, to: .liters, expected: 5.6826125e-1)
        assertConversion(1, from: .imperialQuarts, to: .liters, expected: 1.1365225)
        assertConversion(1, from: .imperialGallons, to: .liters, expected: 4.54609)
        assertConversion(1, from: .metricCups, to: .liters, expected: 2.5e-1)
    }

    func testAccelerationConversions() throws {
        assertConversion(1, from: .metersPerSecondSquared, to: .gravity, expected: 1.019716212977928)
        assertConversion(1, from: .gravity, to: .metersPerSecondSquared, expected: 9.80665)
    }

    func testPowerConversions() throws {
        assertConversion(1, from: .watts, to: .kilowatts, expected: 1e-3)
        assertConversion(1, from: .horsepower, to: .watts, expected: 7.456998715822702e2)
        assertConversion(1, from: .kilowatts, to: .watts, expected: 1e3)
        assertConversion(1, from: .megawatts, to: .kilowatts, expected: 1e3)
        assertConversion(1, from: .gigawatts, to: .megawatts, expected: 1e3)
        assertConversion(1, from: .terawatts, to: .gigawatts, expected: 1e3)
    }

    func testAngleConversions() throws {
        assertConversion(1, from: .degrees, to: .radians, expected: 1.745329251994329e-2)
        assertConversion(1, from: .radians, to: .degrees, expected: 5.729577951308232e1)
        assertConversion(1, from: .arcMinutes, to: .degrees, expected: 1.666666666666667e-2)
        assertConversion(1, from: .arcSeconds, to: .degrees, expected: 2.777777777777778e-4)
        assertConversion(1, from: .gradians, to: .degrees, expected: 9e-1)
        assertConversion(1, from: .revolutions, to: .degrees, expected: 3.6e2)
    }

    func testAngularVelocityConversions() throws {
        assertConversion(1, from: .radiansPerSecond, to: .degreesPerSecond, expected: 5.729577951308232e1)
        assertConversion(1, from: .degreesPerSecond, to: .radiansPerSecond, expected: 1.745329251994329e-2)
        assertConversion(1, from: .revolutionsPerMinute, to: .radiansPerSecond, expected: 1.047197551196598e-1)
        assertConversion(1, from: .revolutionsPerSecond, to: .radiansPerSecond, expected: 6.283185307179586)
    }

    func testAreaConversions() throws {
        assertConversion(1, from: .squareMeters, to: .squareCentimeters, expected: 1e4)
        assertConversion(1, from: .acres, to: .squareMeters, expected: 4.046856e3)
        assertConversion(1, from: .squareKilometers, to: .squareMeters, expected: 1e6)
        assertConversion(1, from: .hectares, to: .squareMeters, expected: 1e4)
        assertConversion(1, from: .squareMegameters, to: .squareKilometers, expected: 1e6)
        assertConversion(1, from: .squareInches, to: .squareCentimeters, expected: 6.4516e-4)
        assertConversion(1, from: .squareFeet, to: .squareMeters, expected: 9.290304e-2)
        assertConversion(1, from: .squareYards, to: .squareMeters, expected: 8.3612736e-1)
        assertConversion(1, from: .squareMiles, to: .squareKilometers, expected: 2.589988110336e6)
    }

    func testConcentrationConversions() throws {
        assertConversion(1, from: .gramsPerLiter, to: .milligramsPerDeciliter, expected: 1e2)
        assertConversion(1, from: .milligramsPerDeciliter, to: .gramsPerLiter, expected: 1e-2)
        assertConversion(1, from: .partsPerMillion, to: .gramsPerLiter, expected: 1e-6)
    }

    func testTimeConversions() throws {
        assertConversion(1, from: .hours, to: .seconds, expected: 3.6e3)
        assertConversion(1, from: .days, to: .hours, expected: 2.4e1)
        assertConversion(1, from: .minutes, to: .seconds, expected: 6e1)
        assertConversion(1, from: .weeks, to: .days, expected: 7)
        assertConversion(1, from: .years, to: .days, expected: 3.6525e2)
        assertConversion(1, from: .decades, to: .years, expected: 1e1)
        assertConversion(1, from: .centuries, to: .years, expected: 1e2)
        assertConversion(1, from: .milliseconds, to: .seconds, expected: 1e-3)
        assertConversion(1, from: .microseconds, to: .seconds, expected: 1e-6)
        assertConversion(1, from: .nanoseconds, to: .seconds, expected: 1e-9)
        assertConversion(1, from: .picoseconds, to: .seconds, expected: 1e-12)
    }

    func testElectricChargeCapacityConversions() throws {
        assertConversion(1, from: .ampereHours, to: .ampereSeconds, expected: 3.6e3)
        assertConversion(1, from: .megaampereHours, to: .ampereHours, expected: 1e6)
        assertConversion(1, from: .kiloampereHours, to: .ampereHours, expected: 1e3)
        assertConversion(1, from: .milliampereHours, to: .ampereHours, expected: 1e-3)
        assertConversion(1, from: .microampereHours, to: .ampereHours, expected: 1e-6)
    }

    func testElectricCurrentConversions() throws {
        assertConversion(1, from: .amperes, to: .milliamperes, expected: 1e3)
        assertConversion(1, from: .milliamperes, to: .amperes, expected: 1e-3)
        assertConversion(1, from: .megaamperes, to: .amperes, expected: 1e6)
        assertConversion(1, from: .kiloamperes, to: .amperes, expected: 1e3)
        assertConversion(1, from: .microamperes, to: .amperes, expected: 1e-6)
    }

    func testElectricPotentialConversions() throws {
        assertConversion(1, from: .volts, to: .millivolts, expected: 1e3)
        assertConversion(1, from: .kilovolts, to: .volts, expected: 1e3)
        assertConversion(1, from: .megavolts, to: .volts, expected: 1e6)
        assertConversion(1, from: .millivolts, to: .volts, expected: 1e-3)
        assertConversion(1, from: .microvolts, to: .volts, expected: 1e-6)
    }

    func testElectricResistanceConversions() throws {
        assertConversion(1, from: .ohms, to: .kiloohms, expected: 1e-3)
        assertConversion(1, from: .kiloohms, to: .ohms, expected: 1e3)
        assertConversion(1, from: .megaohms, to: .ohms, expected: 1e6)
        assertConversion(1, from: .milliohms, to: .ohms, expected: 1e-3)
        assertConversion(1, from: .microohms, to: .ohms, expected: 1e-6)
    }

    func testEnergyConversions() throws {
        assertConversion(1, from: .joules, to: .kilojoules, expected: 1e-3)
        assertConversion(1, from: .calories, to: .joules, expected: 4.184)
        assertConversion(1, from: .kilocalories, to: .joules, expected: 4.184e3)
        assertConversion(1, from: .kilowattHours, to: .joules, expected: 3.6e6)
        assertConversion(1, from: .wattHours, to: .joules, expected: 3.6e3)
    }

    func testFrequencyConversions() throws {
        assertConversion(1, from: .hertz, to: .kilohertz, expected: 1e-3)
        assertConversion(1, from: .megahertz, to: .kilohertz, expected: 1e3)
        assertConversion(1, from: .gigahertz, to: .megahertz, expected: 1e3)
        assertConversion(1, from: .terahertz, to: .gigahertz, expected: 1e3)
        assertConversion(1, from: .millihertz, to: .hertz, expected: 1e-3)
        assertConversion(1, from: .microhertz, to: .hertz, expected: 1e-6)
        assertConversion(1, from: .nanohertz, to: .hertz, expected: 1e-9)
    }

    func testFuelEfficiencyConversions() throws {
        assertConversion(1, from: .litersPer100Kilometers, to: .milesPerGallon, expected: 2.352144214666089)
        assertConversion(1, from: .milesPerImperialGallon, to: .litersPer100Kilometers, expected: 3.54006e-1)
    }

    func testDataConversions() throws {
        assertConversion(1, from: .bytes, to: .bits, expected: 8)
        assertConversion(1, from: .kilobytes, to: .bytes, expected: 1.024e3)
        assertConversion(1, from: .megabytes, to: .kilobytes, expected: 1.048576e3)
        assertConversion(1, from: .gigabytes, to: .megabytes, expected: 1.073741824e3)
        assertConversion(1, from: .terabytes, to: .gigabytes, expected: 1.099511627776e3)
        assertConversion(1, from: .petabytes, to: .terabytes, expected: 1.125899906842624e3)
        assertConversion(1, from: .exabytes, to: .petabytes, expected: 1.152921504606847e3)
        assertConversion(1, from: .zettabytes, to: .exabytes, expected: 1.180591620717411e3)
        assertConversion(1, from: .yottabytes, to: .zettabytes, expected: 1.208925819614629e3)
        assertConversion(1, from: .yobibytes, to: .zebibytes, expected: 1.024e3)
        assertConversion(1, from: .zebibytes, to: .exbibytes, expected: 1.024e3)
        assertConversion(1, from: .exbibytes, to: .pebibytes, expected: 1.024e3)
        assertConversion(1, from: .pebibytes, to: .tebibytes, expected: 1.024e3)
        assertConversion(1, from: .tebibytes, to: .gibibytes, expected: 1.024e3)
        assertConversion(1, from: .gibibytes, to: .mebibytes, expected: 1.024e3)
        assertConversion(1, from: .mebibytes, to: .kibibytes, expected: 1.024e3)
        assertConversion(1, from: .kibibytes, to: .bytes, expected: 1.024e3)
        assertConversion(1, from: .nibbles, to: .bits, expected: 4)
        assertConversion(1, from: .kilobits, to: .bits, expected: 1e3)
        assertConversion(1, from: .megabits, to: .bits, expected: 1e6)
        assertConversion(1, from: .gigabits, to: .bits, expected: 1e9)
        assertConversion(1, from: .terabits, to: .bits, expected: 1e12)
        assertConversion(1, from: .petabits, to: .bits, expected: 1e15)
        assertConversion(1, from: .exabits, to: .bits, expected: 1e18)
        assertConversion(1, from: .zettabits, to: .bits, expected: 1e21)
        assertConversion(1, from: .yottabits, to: .bits, expected: 1e24)
        assertConversion(1, from: .kibibits, to: .bits, expected: 1.024e3)
        assertConversion(1, from: .mebibits, to: .bits, expected: 1.048576e6)
        assertConversion(1, from: .gibibits, to: .bits, expected: 1.073741824e9)
        assertConversion(1, from: .tebibits, to: .bits, expected: 1.099511627776e12)
        assertConversion(1, from: .pebibits, to: .bits, expected: 1.125899906842624e15)
        assertConversion(1, from: .exbibits, to: .bits, expected: 1.152921504606847e18)
        assertConversion(1, from: .zebibits, to: .bits, expected: 1.180591620717411e21)
        assertConversion(1, from: .yobibits, to: .bits, expected: 1.208925819614629e24)
    }
}
