@testable import AUnit
import XCTest

final class AUnitConversionTests: XCTestCase {
    let epsilon = 1e-10 // 设定容忍度，增加精度

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
        assertConversion(1, from: .feet, to: .meters, expected: 0.3048)
        assertConversion(1, from: .nauticalMiles, to: .meters, expected: 1852)
        assertConversion(1, from: .meters, to: .kilometers, expected: 0.001)
        assertConversion(1, from: .miles, to: .kilometers, expected: 1.609344)
        assertConversion(1, from: .inches, to: .centimeters, expected: 2.54)
        assertConversion(1, from: .yards, to: .meters, expected: 0.9144)
        assertConversion(1, from: .lightyears, to: .kilometers, expected: 9460730472580.8)
        assertConversion(1, from: .parsecs, to: .lightyears, expected: 3.26156)
        assertConversion(1, from: .fathoms, to: .meters, expected: 1.8288)
        assertConversion(1, from: .furlongs, to: .meters, expected: 201.168)
        assertConversion(1, from: .astronomicalUnits, to: .kilometers, expected: 149597870.7)
    }

    func testSpeedConversions() throws {
        assertConversion(1, from: .knots, to: .metersPerSecond, expected: 0.514444)
        assertConversion(1, from: .metersPerSecond, to: .kilometersPerHour, expected: 3.6)
        assertConversion(1, from: .milesPerHour, to: .kilometersPerHour, expected: 1.60934)
        assertConversion(1, from: .feetPerSecond, to: .metersPerSecond, expected: 0.3048)
        assertConversion(1, from: .feetPerMinute, to: .metersPerSecond, expected: 0.00508)
        assertConversion(1, from: .inchesPerSecond, to: .metersPerSecond, expected: 0.0254)
    }

    func testPressureConversions() throws {
        assertConversion(1, from: .hectopascals, to: .newtonsPerMetersSquared, expected: 100)
        assertConversion(1, from: .bars, to: .newtonsPerMetersSquared, expected: 100000)
        assertConversion(1, from: .millibars, to: .newtonsPerMetersSquared, expected: 100)
        assertConversion(1, from: .poundsForcePerSquareInch, to: .newtonsPerMetersSquared, expected: 6894.76)
        assertConversion(1, from: .inchesOfMercury, to: .newtonsPerMetersSquared, expected: 3386.39)
        assertConversion(1, from: .millimetersOfMercury, to: .newtonsPerMetersSquared, expected: 133.322)
    }

    func testTemperatureConversions() throws {
        assertConversion(0, from: .celsius, to: .kelvin, expected: 273.15)
        assertConversion(0, from: .fahrenheit, to: .celsius, expected: -17.7778)
        assertConversion(0, from: .kelvin, to: .celsius, expected: -273.15)
        assertConversion(32, from: .fahrenheit, to: .celsius, expected: 0)
        assertConversion(100, from: .celsius, to: .fahrenheit, expected: 212)
        assertConversion(212, from: .fahrenheit, to: .celsius, expected: 100)
        assertConversion(1, from: .rankine, to: .kelvin, expected: 0.555556)
    }

    func testTemperatureDifferenceConversions() throws {
        assertConversion(1, from: .celsiusDelta, to: .fahrenheitDelta, expected: 1.8)
        assertConversion(1, from: .fahrenheitDelta, to: .celsiusDelta, expected: 0.555556)
    }

    func testMassConversions() throws {
        assertConversion(1, from: .kilograms, to: .grams, expected: 1000)
        assertConversion(1, from: .grams, to: .milligrams, expected: 1000)
        assertConversion(1, from: .metricTons, to: .kilograms, expected: 1000)
        assertConversion(1, from: .pounds, to: .grams, expected: 453.592)
        assertConversion(1, from: .ounces, to: .grams, expected: 28.3495)
        assertConversion(1, from: .stones, to: .kilograms, expected: 6.35029)
        assertConversion(1, from: .carats, to: .grams, expected: 0.2)
        assertConversion(1, from: .ouncesTroy, to: .grams, expected: 31.1035)
        assertConversion(1, from: .slugs, to: .kilograms, expected: 14.5939)
        assertConversion(1, from: .kilopounds, to: .grams, expected: 453592)
    }

    func testVolumeConversions() throws {
        assertConversion(1, from: .liters, to: .cubicMeters, expected: 0.001)
        assertConversion(1, from: .gallons, to: .liters, expected: 3.78541)
        assertConversion(1, from: .milliliters, to: .liters, expected: 0.001)
        assertConversion(1, from: .cubicInches, to: .cubicCentimeters, expected: 16.3871)
        assertConversion(1, from: .cubicFeet, to: .liters, expected: 28.3168)
        assertConversion(1, from: .cubicYards, to: .cubicMeters, expected: 0.764555)
        assertConversion(1, from: .cubicMiles, to: .cubicKilometers, expected: 4.16818)
        assertConversion(1, from: .acreFeet, to: .cubicMeters, expected: 1233.48)
        assertConversion(1, from: .bushels, to: .liters, expected: 35.2391)
        assertConversion(1, from: .teaspoons, to: .milliliters, expected: 4.92892)
        assertConversion(1, from: .tablespoons, to: .milliliters, expected: 14.7868)
        assertConversion(1, from: .fluidOunces, to: .milliliters, expected: 29.5735)
        assertConversion(1, from: .cups, to: .liters, expected: 0.24)
        assertConversion(1, from: .pints, to: .liters, expected: 0.473176)
        assertConversion(1, from: .imperialTeaspoons, to: .milliliters, expected: 5.91939)
        assertConversion(1, from: .imperialTablespoons, to: .milliliters, expected: 17.7582)
        assertConversion(1, from: .imperialFluidOunces, to: .milliliters, expected: 28.4131)
        assertConversion(1, from: .imperialPints, to: .liters, expected: 0.568261)
        assertConversion(1, from: .imperialQuarts, to: .liters, expected: 1.13652)
        assertConversion(1, from: .imperialGallons, to: .liters, expected: 4.54609)
        assertConversion(1, from: .metricCups, to: .liters, expected: 0.25)
    }

    func testAccelerationConversions() throws {
        assertConversion(1, from: .metersPerSecondSquared, to: .gravity, expected: 0.101972)
        assertConversion(1, from: .gravity, to: .metersPerSecondSquared, expected: 9.80665)
    }

    func testPowerConversions() throws {
        assertConversion(1, from: .watts, to: .kilowatts, expected: 0.001)
        assertConversion(1, from: .horsepower, to: .watts, expected: 745.7)
        assertConversion(1, from: .kilowatts, to: .watts, expected: 1000)
        assertConversion(1, from: .megawatts, to: .kilowatts, expected: 1000)
        assertConversion(1, from: .gigawatts, to: .megawatts, expected: 1000)
        assertConversion(1, from: .terawatts, to: .gigawatts, expected: 1000)
    }

    func testAngleConversions() throws {
        assertConversion(1, from: .degrees, to: .radians, expected: 0.0174533)
        assertConversion(1, from: .radians, to: .degrees, expected: 57.2958)
        assertConversion(1, from: .arcMinutes, to: .degrees, expected: 0.0166667)
        assertConversion(1, from: .arcSeconds, to: .degrees, expected: 0.000277778)
        assertConversion(1, from: .gradians, to: .degrees, expected: 0.9)
        assertConversion(1, from: .revolutions, to: .degrees, expected: 360)
    }

    func testAngularVelocityConversions() throws {
        assertConversion(1, from: .radiansPerSecond, to: .degreesPerSecond, expected: 57.2958)
        assertConversion(1, from: .degreesPerSecond, to: .radiansPerSecond, expected: 0.0174533)
        assertConversion(1, from: .revolutionsPerMinute, to: .radiansPerSecond, expected: 0.10472)
        assertConversion(1, from: .revolutionsPerSecond, to: .radiansPerSecond, expected: 6.28319)
    }

    func testAreaConversions() throws {
        assertConversion(1, from: .squareMeters, to: .squareCentimeters, expected: 10000)
        assertConversion(1, from: .acres, to: .squareMeters, expected: 4046.86)
        assertConversion(1, from: .squareKilometers, to: .squareMeters, expected: 1000000)
        assertConversion(1, from: .hectares, to: .squareMeters, expected: 10000)
        assertConversion(1, from: .squareMegameters, to: .squareKilometers, expected: 1000000)
        assertConversion(1, from: .squareInches, to: .squareCentimeters, expected: 6.4516)
        assertConversion(1, from: .squareFeet, to: .squareMeters, expected: 0.092903)
        assertConversion(1, from: .squareYards, to: .squareMeters, expected: 0.836127)
        assertConversion(1, from: .squareMiles, to: .squareKilometers, expected: 2.58999)
    }

    func testConcentrationConversions() throws {
        assertConversion(1, from: .gramsPerLiter, to: .milligramsPerDeciliter, expected: 100)
        assertConversion(1, from: .milligramsPerDeciliter, to: .gramsPerLiter, expected: 0.01)
        assertConversion(1, from: .partsPerMillion, to: .gramsPerLiter, expected: 0.001)
    }

    func testTimeConversions() throws {
        assertConversion(1, from: .hours, to: .seconds, expected: 3600)
        assertConversion(1, from: .days, to: .hours, expected: 24)
        assertConversion(1, from: .minutes, to: .seconds, expected: 60)
        assertConversion(1, from: .weeks, to: .days, expected: 7)
        assertConversion(1, from: .years, to: .days, expected: 365.25)
        assertConversion(1, from: .decades, to: .years, expected: 10)
        assertConversion(1, from: .centuries, to: .years, expected: 100)
        assertConversion(1, from: .milliseconds, to: .seconds, expected: 0.001)
        assertConversion(1, from: .microseconds, to: .seconds, expected: 0.000001)
        assertConversion(1, from: .nanoseconds, to: .seconds, expected: 0.000000001)
        assertConversion(1, from: .picoseconds, to: .seconds, expected: 0.000000000001)
    }

    func testElectricChargeCapacityConversions() throws {
        assertConversion(1, from: .ampereHours, to: .ampereSeconds, expected: 3600)
        assertConversion(1, from: .megaampereHours, to: .ampereHours, expected: 1000000)
        assertConversion(1, from: .kiloampereHours, to: .ampereHours, expected: 1000)
        assertConversion(1, from: .milliampereHours, to: .ampereHours, expected: 0.001)
        assertConversion(1, from: .microampereHours, to: .ampereHours, expected: 0.000001)
    }

    func testElectricCurrentConversions() throws {
        assertConversion(1, from: .amperes, to: .milliamperes, expected: 1000)
        assertConversion(1, from: .milliamperes, to: .amperes, expected: 0.001)
        assertConversion(1, from: .megaamperes, to: .amperes, expected: 1000000)
        assertConversion(1, from: .kiloamperes, to: .amperes, expected: 1000)
        assertConversion(1, from: .microamperes, to: .amperes, expected: 0.000001)
    }

    func testElectricPotentialConversions() throws {
        assertConversion(1, from: .volts, to: .millivolts, expected: 1000)
        assertConversion(1, from: .kilovolts, to: .volts, expected: 1000)
        assertConversion(1, from: .megavolts, to: .volts, expected: 1000000)
        assertConversion(1, from: .millivolts, to: .volts, expected: 0.001)
        assertConversion(1, from: .microvolts, to: .volts, expected: 0.000001)
    }

    func testElectricResistanceConversions() throws {
        assertConversion(1, from: .ohms, to: .kiloohms, expected: 0.001)
        assertConversion(1, from: .kiloohms, to: .ohms, expected: 1000)
        assertConversion(1, from: .megaohms, to: .ohms, expected: 1000000)
        assertConversion(1, from: .milliohms, to: .ohms, expected: 0.001)
        assertConversion(1, from: .microohms, to: .ohms, expected: 0.000001)
    }

    func testEnergyConversions() throws {
        assertConversion(1, from: .joules, to: .kilojoules, expected: 0.001)
        assertConversion(1, from: .calories, to: .joules, expected: 4.184)
        assertConversion(1, from: .kilocalories, to: .joules, expected: 4184)
        assertConversion(1, from: .kilowattHours, to: .joules, expected: 3600000)
        assertConversion(1, from: .wattHours, to: .joules, expected: 3600)
    }

    func testFrequencyConversions() throws {
        assertConversion(1, from: .hertz, to: .kilohertz, expected: 0.001)
        assertConversion(1, from: .megahertz, to: .kilohertz, expected: 1000)
        assertConversion(1, from: .gigahertz, to: .megahertz, expected: 1000)
        assertConversion(1, from: .terahertz, to: .gigahertz, expected: 1000)
        assertConversion(1, from: .millihertz, to: .hertz, expected: 0.001)
        assertConversion(1, from: .microhertz, to: .hertz, expected: 0.000001)
        assertConversion(1, from: .nanohertz, to: .hertz, expected: 0.000000001)
    }

    func testFuelEfficiencyConversions() throws {
        assertConversion(1, from: .litersPer100Kilometers, to: .milesPerGallon, expected: 235.215 / 1)
        assertConversion(1, from: .milesPerImperialGallon, to: .litersPer100Kilometers, expected: 1 / 282.481)
    }

    func testDataConversions() throws {
        assertConversion(1, from: .bytes, to: .bits, expected: 8)
        assertConversion(1, from: .kilobytes, to: .bytes, expected: 1024)
        assertConversion(1, from: .megabytes, to: .kilobytes, expected: 1024)
        assertConversion(1, from: .gigabytes, to: .megabytes, expected: 1024)
        assertConversion(1, from: .terabytes, to: .gigabytes, expected: 1024)
        assertConversion(1, from: .petabytes, to: .terabytes, expected: 1024)
        assertConversion(1, from: .exabytes, to: .petabytes, expected: 1024)
        assertConversion(1, from: .zettabytes, to: .exabytes, expected: 1024)
        assertConversion(1, from: .yottabytes, to: .zettabytes, expected: 1024)
        assertConversion(1, from: .yobibytes, to: .zebibytes, expected: 1024)
        assertConversion(1, from: .zebibytes, to: .exbibytes, expected: 1024)
        assertConversion(1, from: .exbibytes, to: .pebibytes, expected: 1024)
        assertConversion(1, from: .pebibytes, to: .tebibytes, expected: 1024)
        assertConversion(1, from: .tebibytes, to: .gibibytes, expected: 1024)
        assertConversion(1, from: .gibibytes, to: .mebibytes, expected: 1024)
        assertConversion(1, from: .mebibytes, to: .kibibytes, expected: 1024)
        assertConversion(1, from: .kibibytes, to: .bytes, expected: 1024)
        assertConversion(1, from: .nibbles, to: .bits, expected: 4)
        assertConversion(1, from: .kilobits, to: .bits, expected: 1000)
        assertConversion(1, from: .megabits, to: .bits, expected: 1000000)
        assertConversion(1, from: .gigabits, to: .bits, expected: 1000000000)
        assertConversion(1, from: .terabits, to: .bits, expected: 1000000000000)
        assertConversion(1, from: .petabits, to: .bits, expected: 1000000000000000)
        assertConversion(1, from: .exabits, to: .bits, expected: 1000000000000000000)
        assertConversion(1, from: .zettabits, to: .bits, expected: 1000000000000000000000)
        assertConversion(1, from: .yottabits, to: .bits, expected: 1000000000000000000000000)
        assertConversion(1, from: .kibibits, to: .bits, expected: 1024)
        assertConversion(1, from: .mebibits, to: .bits, expected: 1048576)
        assertConversion(1, from: .gibibits, to: .bits, expected: 1073741824)
        assertConversion(1, from: .tebibits, to: .bits, expected: 1099511627776)
        assertConversion(1, from: .pebibits, to: .bits, expected: 1125899906842624)
        assertConversion(1, from: .exbibits, to: .bits, expected: 1152921504606846976)
        assertConversion(1, from: .zebibits, to: .bits, expected: 1180591620717411303424)
        assertConversion(1, from: .yobibits, to: .bits, expected: 1208925819614629174706176)
    }
}
