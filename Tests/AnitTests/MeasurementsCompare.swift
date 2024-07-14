@testable import AUnit
import Foundation
import XCTest

final class MeasurementsCompare: XCTestCase {
    let epsilon = 1e-2 // 设定容忍度，增加精度

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

    func testLengthConversions() {
        let foundationUnits: [(from: UnitLength, to: UnitLength, value: Double, expected: Double)] = [
            (.feet, .meters, 1.0, 0.3048),
            (.nauticalMiles, .meters, 1.0, 1852.0),
            (.kilometers, .meters, 1.0, 1000.0),
            (.miles, .meters, 1.0, 1609.344),
            (.inches, .meters, 1.0, 0.0254),
            (.yards, .meters, 1.0, 0.9144),
            (.lightyears, .meters, 1.0, 9.4607304725808e15)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testMassConversions() {
        let foundationUnits: [(from: UnitMass, to: UnitMass, value: Double, expected: Double)] = [
            (.kilograms, .grams, 1.0, 1000.0),
            (.pounds, .grams, 1.0, 453.59237),
            (.ounces, .grams, 1.0, 28.349523125),
            (.metricTons, .grams, 1.0, 1.0e6),
            (.stones, .grams, 1.0, 6350.29318)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testVolumeConversions() {
        let foundationUnits: [(from: UnitVolume, to: UnitVolume, value: Double, expected: Double)] = [
            (.liters, .cubicMeters, 1.0, 0.001),
            (.gallons, .liters, 1.0, 3.785411784),
            (.cubicFeet, .cubicMeters, 1.0, 0.028316846592),
            (.quarts, .liters, 1.0, 0.946352946),
            (.pints, .liters, 1.0, 0.473176473)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testSpeedConversions() {
        let foundationUnits: [(from: UnitSpeed, to: UnitSpeed, value: Double, expected: Double)] = [
            (.knots, .metersPerSecond, 1.0, 0.514444),
            (.milesPerHour, .metersPerSecond, 1.0, 0.44704),
            (.kilometersPerHour, .metersPerSecond, 1.0, 0.277778)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testPressureConversions() {
        let foundationUnits: [(from: UnitPressure, to: UnitPressure, value: Double, expected: Double)] = [
            (.hectopascals, .newtonsPerMetersSquared, 1.0, 100.0),
            (.inchesOfMercury, .newtonsPerMetersSquared, 1.0, 3386.389),
            (.millimetersOfMercury, .newtonsPerMetersSquared, 1.0, 133.322),
            (.bars, .newtonsPerMetersSquared, 1.0, 1.0e5)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testTemperatureConversions() {
        let foundationUnits: [(from: UnitTemperature, to: UnitTemperature, value: Double, expected: Double)] = [
            (.celsius, .kelvin, 0.0, 273.15),
            (.fahrenheit, .kelvin, 32.0, 273.15)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testPowerConversions() {
        let foundationUnits: [(from: UnitPower, to: UnitPower, value: Double, expected: Double)] = [
            (.kilowatts, .watts, 1.0, 1000.0),
            (.horsepower, .watts, 1.0, 745.69987158227022)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    func testEnergyConversions() {
        let foundationUnits: [(from: UnitEnergy, to: UnitEnergy, value: Double, expected: Double)] = [
            (.joules, .kilojoules, 1000.0, 1.0),
            (.calories, .joules, 1.0, 4.184),
            (.kilowattHours, .joules, 1.0, 3.6e6)
        ]

        for unit in foundationUnits {
            let measurement = Measurement(value: unit.value, unit: unit.from)
            let converted = measurement.converted(to: unit.to)
            XCTAssertEqual(converted.value, unit.expected, accuracy: epsilon, "Conversion from \(unit.from) to \(unit.to) expected to be \(unit.expected), but got \(converted.value)")
        }
    }

    // 添加更多的测试方法以覆盖所有可能的单位类型和转换
}
