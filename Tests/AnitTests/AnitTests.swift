@testable import AUnit
import XCTest

final class AUnitTests: XCTestCase {
    func testConversions() throws {
        let epsilon = 1e-7 // 设定容忍度，增加精度

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

        // 测试温度转换
        assertConversion(100, from: .celsius, to: .kelvin, expected: 373.15)
        assertConversion(100, from: .celsius, to: .fahrenheit, expected: 212)
        assertConversion(273.15, from: .kelvin, to: .celsius, expected: 0)
        assertConversion(1, from: .celsiusDelta, to: .fahrenheitDelta, expected: 1.8)
        assertConversion(1, from: .rankine, to: .kelvin, expected: 0.555556)
        assertConversion(0, from: .celsius, to: .fahrenheit, expected: 32)
        assertConversion(32, from: .fahrenheit, to: .celsius, expected: 0)
        assertConversion(0, from: .kelvin, to: .celsius, expected: -273.15)
        assertConversion(0, from: .rankine, to: .celsius, expected: -273.15)

        // 测试速度转换
        assertConversion(1, from: .metersPerSecond, to: .kilometersPerHour, expected: 3.6)
        assertConversion(1, from: .yardsPerSecond, to: .metersPerSecond, expected: 0.9144)
        assertConversion(100, from: .kilometersPerHour, to: .metersPerSecond, expected: 27.7778)
        assertConversion(60, from: .milesPerHour, to: .feetPerSecond, expected: 88)

        // 测试时间转换
        assertConversion(1, from: .days, to: .seconds, expected: 86400)
        assertConversion(1, from: .hours, to: .minutes, expected: 60)
        assertConversion(1, from: .minutes, to: .seconds, expected: 60)
        assertConversion(1, from: .weeks, to: .days, expected: 7)
        assertConversion(1, from: .years, to: .days, expected: 365.25)

        // 测试质量转换
        assertConversion(1, from: .kilograms, to: .grams, expected: 1000)
        assertConversion(1, from: .metricTons, to: .kilopounds, expected: 2.20462)
        assertConversion(1, from: .grams, to: .milligrams, expected: 1000)
        assertConversion(1, from: .metricTons, to: .kilograms, expected: 1000)
        assertConversion(1, from: .pounds, to: .ounces, expected: 16)

        // 测试体积转换
        assertConversion(1, from: .liters, to: .cubicMeters, expected: 0.001)
        assertConversion(1, from: .cubicMeters, to: .liters, expected: 1000)
        assertConversion(1, from: .gallons, to: .liters, expected: 3.78541)
        assertConversion(1, from: .milliliters, to: .cubicCentimeters, expected: 1)

        // 测试压力转换
        assertConversion(1, from: .bars, to: .kilopascals, expected: 100)
        assertConversion(1, from: .poundsForcePerSquareInch, to: .kilopascals, expected: 6.89476)
        assertConversion(1, from: .millibars, to: .hectopascals, expected: 1)

        // 测试功率转换
        assertConversion(1, from: .horsepower, to: .watts, expected: 745.69987158227022)
        assertConversion(1, from: .kilowatts, to: .watts, expected: 1000)
        assertConversion(1, from: .watts, to: .milliwatts, expected: 1000)

        // 测试角度转换
        assertConversion(180, from: .degrees, to: .radians, expected: Double.pi)
        assertConversion(1, from: .radians, to: .degrees, expected: 57.2958)
        assertConversion(1, from: .degrees, to: .arcMinutes, expected: 60)
        assertConversion(1, from: .arcMinutes, to: .arcSeconds, expected: 60)

        // 测试电流转换
        assertConversion(1, from: .amperes, to: .milliamperes, expected: 1000)
        assertConversion(1, from: .milliamperes, to: .amperes, expected: 0.001)

        // 测试数据转换
        assertConversion(1, from: .bytes, to: .bits, expected: 8)
        assertConversion(1, from: .kilobytes, to: .bytes, expected: 1024)
        assertConversion(1, from: .megabytes, to: .kilobytes, expected: 1024)
        assertConversion(1, from: .gigabytes, to: .megabytes, expected: 1024)
    }

    func testAllTranslations() throws {
        // 获取所有可用的本地化列表，过滤掉 Base 本地化
        let localizations = Bundle.module.localizations.filter { $0 != "Base" }

        // 循环遍历每种本地化
        for localization in localizations {
            // 获取当前本地化的路径和 Bundle 对象
            guard let bundlePath = Bundle.module.path(forResource: localization, ofType: "lproj"),
                  let localizedBundle = Bundle(path: bundlePath)
            else {
                continue // 如果未找到本地化包，则跳过
            }

            // 用于记录缺失翻译的数组
            var missingTranslations: [String] = []

            // 检查每个 AUnit 的翻译
            for unit in AUnit.allCases {
                // 获取符号、短名称和长名称的翻译
                let symbol = NSLocalizedString("\(unit).symbol", bundle: localizedBundle, comment: "")
                let shortName = NSLocalizedString("\(unit).shortName", bundle: localizedBundle, comment: "")
                let longName = NSLocalizedString("\(unit).longName", bundle: localizedBundle, comment: "")

                // 检查符号翻译是否存在
                if symbol == "\(unit.self).symbol" {
                    missingTranslations.append("\(localization): \(unit).symbol") // 记录缺失的符号翻译
                }
                // 检查短名称翻译是否存在
                if shortName == "\(unit.self).shortName" {
                    missingTranslations.append("\(localization): \(unit).shortName") // 记录缺失的短名称翻译
                }
                // 检查长名称翻译是否存在
                if longName == "\(unit.self).longName" {
                    missingTranslations.append("\(localization): \(unit).longName") // 记录缺失的长名称翻译
                }
            }

            // 检查每个 AUnitType 的翻译
            for unitType in AUnitType.allCases {
                // 获取符号、短名称和长名称的翻译
                let symbol = NSLocalizedString("\(unitType).symbol", bundle: localizedBundle, comment: "")
                let shortName = NSLocalizedString("\(unitType).shortName", bundle: localizedBundle, comment: "")
                let longName = NSLocalizedString("\(unitType).longName", bundle: localizedBundle, comment: "")

                // 检查符号翻译是否存在
                if symbol == "\(unitType.self).symbol" {
                    missingTranslations.append("\(localization): \(unitType).symbol") // 记录缺失的符号翻译
                }
                // 检查短名称翻译是否存在
                if shortName == "\(unitType.self).shortName" {
                    missingTranslations.append("\(localization): \(unitType).shortName") // 记录缺失的短名称翻译
                }
                // 检查长名称翻译是否存在
                if longName == "\(unitType.self).longName" {
                    missingTranslations.append("\(localization): \(unitType).longName") // 记录缺失的长名称翻译
                }
            }

            // 如果存在缺失的翻译，标记测试失败并输出缺失的翻译
            if !missingTranslations.isEmpty {
                XCTFail("Missing translations: \(missingTranslations.joined(separator: ", "))")
            }
        }
    }
}
