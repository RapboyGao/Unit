import Foundation

public struct AMLength: AMeasurementProtocol {
    public var value: Double
    public var unit: AULength

    public init(value: Double, unit: AULength) {
        self.value = value
        self.unit = unit
    }
}
