import Foundation

/// A struct representing a pressure measurement.
/// 表示压力测量的结构体。
public struct AMPressure: AMeasurementProtocol {
    public var value: Double
    public var unit: AUPressure

    /// Initializes a new pressure measurement.
    /// 初始化一个新的压力测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///            测量的值。
    ///   - unit: The unit of the measurement.
    ///           测量的单位。
    public init(value: Double, unit: AUPressure) {
        self.value = value
        self.unit = unit
    }
}
