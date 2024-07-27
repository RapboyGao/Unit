import Foundation

/// A struct representing a time measurement.
/// 表示时间测量的结构体。
public struct AMTime: AMeasurementProtocol {
    public var value: Double
    public var unit: AUTime

    /// Initializes a new time measurement.
    /// 初始化一个新的时间测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///            测量的值。
    ///   - unit: The unit of the measurement.
    ///           测量的单位。
    public init(value: Double, unit: AUTime) {
        self.value = value
        self.unit = unit
    }
}
