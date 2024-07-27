import Foundation

/// A struct representing a speed measurement.
/// 表示速度测量的结构体。
public struct AMSpeed: AMeasurementProtocol {
    public var value: Double
    public var unit: AUSpeed

    /// Initializes a new speed measurement.
    /// 初始化一个新的速度测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///            测量的值。
    ///   - unit: The unit of the measurement.
    ///           测量的单位。
    public init(value: Double, unit: AUSpeed) {
        self.value = value
        self.unit = unit
    }
}
