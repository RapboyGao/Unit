import Foundation

/// A struct representing a mass measurement.
/// 表示质量测量的结构体。
public struct AMMass: AMeasurementProtocol {
    public var value: Double
    public var unit: AUMass

    /// Initializes a new mass measurement.
    /// 初始化一个新的质量测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///            测量的值。
    ///   - unit: The unit of the measurement.
    ///           测量的单位。
    public init(value: Double, unit: AUMass) {
        self.value = value
        self.unit = unit
    }
}
