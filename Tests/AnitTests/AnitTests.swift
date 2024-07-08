@testable import AUnit
import XCTest

final class AnitTests: XCTestCase {
    func testExample() throws {
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
}
