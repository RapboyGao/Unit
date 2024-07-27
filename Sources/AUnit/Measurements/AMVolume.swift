import Foundation

/// A struct representing a volume measurement.
/// 表示体积测量的结构体。
public struct AMVolume: AMeasurementProtocol {
    public var value: Double
    public var unit: AUVolume

    /// Initializes a new volume measurement.
    /// 初始化一个新的体积测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///            测量的值。
    ///   - unit: The unit of the measurement.
    ///           测量的单位。
    public init(value: Double, unit: AUVolume) {
        self.value = value
        self.unit = unit
    }
}
