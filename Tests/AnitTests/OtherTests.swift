@testable import AUnit
import XCTest

final class OtherTests: XCTestCase {
    func testSummary() throws {
        print("现在一共有\(AUnit.allCases.count)种单位")
    }

    func testSummary2() throws {
        for unitType in AUnitType.allCases {
            let capitalFirst = "\(unitType)".replacing(#/^\w/#) { match in
                match.capitalized
            }
            let caseStrings = unitType.allUnits.map { unit in
                "\(unit)"
            }
            let coefficientStrings = unitType.allUnits.map { unit in
                "case .\(unit): return \(unit.coefficient)"
            }
            let aUnitStrings = caseStrings.map {
                "case .\($0): return .\($0)"
            }
            let baseUnit = unitType.allUnits.first { $0.coefficient == 1 && $0.constant == 0 }
            guard let baseUnit = baseUnit
            else { fatalError("没有基准单位") }
            let toPrint = """

            // ---------\(capitalFirst)------------
            public enum AU\(capitalFirst): AUnitProtocol, Identifiable{
                case \(caseStrings.joined(separator: ","))

                public var coefficient: Double {
                    switch self {
                    \(coefficientStrings.joined(separator: "\n\t\t"))
                    }
                }

                public var aUnit: AUnit {
                    switch self {
                    \(aUnitStrings.joined(separator: "\n\t\t"))
                    }
                }

                public static var baseUnit: AU\(capitalFirst) = .\(baseUnit)

                public var id: AU\(capitalFirst) { self }

                public func toBaseValue(value: Double) -> Double {
                    return value * self.coefficient
                }

                public func fromBaseValue(value: Double) -> Double {
                    return value / self.coefficient
                }
            }


            """
            print(toPrint)
        }
    }
}
