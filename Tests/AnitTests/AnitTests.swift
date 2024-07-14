@testable import AUnit
import XCTest

final class AUnitTests: XCTestCase {
    func test1() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

        let celsiusValue = AMeasurement(value: 100, unit: .celsius)
        if let kelvinValue = celsiusValue.converted(to: .kelvin) {
            print("100°C in Kelvin: \(kelvinValue.description)") // 应该输出 "373.15 K"
        }

        let fahrenheitValue = AMeasurement(value: 100, unit: .celsius)
        if let fahrenheitConverted = fahrenheitValue.converted(to: .fahrenheit) {
            print("100°C in Fahrenheit: \(fahrenheitConverted.description)") // 应该输出 "212 °F"
        }

        let kelvinToCelsius = AMeasurement(value: 273.15, unit: .kelvin)
        if let celsiusConverted = kelvinToCelsius.converted(to: .celsius) {
            print("273.15 K in Celsius: \(celsiusConverted.description)") // 应该输出 "0 °C"
        }

        let tempDiffCelsius = AMeasurement(value: 1, unit: .celsiusDelta)
        if let tempDiffFahrenheit = tempDiffCelsius.converted(to: .fahrenheitDelta) {
            print("1°C delta in Fahrenheit delta: \(tempDiffFahrenheit.description)") // 应该输出 "1.8 °F"
        }
    }

    func test2() throws {
        let speed = AMeasurement(value: 460, unit: .knots)
        let time = AMeasurement(value: 1, unit: .hours)
        let distance = speed.multiplying(by: time, recalculate: false)
        print(distance?.converted(to: .kilometers) ?? "nil")
    }

    func test3() throws {
        let mass = AMeasurement(value: 1, unit: .kilograms)
        if let massInKilopounds = mass.converted(to: .kilopounds) {
            print("1 kg in kilopounds: \(massInKilopounds.description)") // 应该输出 "0.00220462 kilopounds"
        }
    }

    func test4() throws {
        let time = AMeasurement(value: 1, unit: .days)
        if let timeInSeconds = time.converted(to: .seconds) {
            print("1 day in seconds: \(timeInSeconds.description)") // 应该输出 "86400 seconds"
        }
    }

    func test5() throws {
        let temperature = AMeasurement(value: 1, unit: .rankine)
        if let temperatureInKelvin = temperature.converted(to: .kelvin) {
            print("1°R in Kelvin: \(temperatureInKelvin.description)") // 应该输出 "0.555556 K"
        }
    }

    func test6() throws {
        let speed = AMeasurement(value: 1, unit: .yardsPerSecond)
        if let speedInMetersPerSecond = speed.converted(to: .metersPerSecond) {
            print("1 yard/second in meters/second: \(speedInMetersPerSecond.description)") // 应该输出 "0.9144 m/s"
        }
    }

    func testAllNamesNotEmpty() throws {
        for unit in AUnit.allCases {
            guard unit.symbol != "\(unit.self).symbol",
                  unit.shortName != "\(unit.self).shortName",
                  unit.longName != "\(unit.self).longName"
            else { throw XCTestError(.timeoutWhileWaiting) }
            print(unit.symbol, unit.shortName, unit.longName)
        }
        for unitType in AUnitType.allCases {
            guard unitType.symbol != "\(unitType.self).symbol",
                  unitType.shortName != "\(unitType.self).shortName",
                  unitType.longName != "\(unitType.self).longName"
            else { throw XCTestError(.timeoutWhileWaiting) }
            print(unitType.symbol, unitType.shortName, unitType.longName)
        }
    }
}
