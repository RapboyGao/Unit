import Foundation

/// Enum representing the types of units.
/// 表示单位类型的枚举。
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data

    public var id: AUnitType { self }

    /// The symbol for the unit type.
    /// 单位类型的符号。
    /// 尽可能一个字/词
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit type.
    /// 单位类型的短名称。
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit type.
    /// 单位类型的全名称。
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit type.
    /// 单位类型的详细介绍。
    public var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// The SF Symbol name for the unit type.
    /// 单位类型的 SF Symbol 名称。
    public var systemImage: String {
        switch self {
        case .length: return "ruler"
        case .speed: return "speedometer"
        case .pressure: return "gauge"
        case .temperature: return "thermometer"
        case .temperatureDifference: return "thermometer.transmission"
        case .mass: return "scalemass"
        case .volume: return "cube.box"
        case .acceleration: return "arrow.up.and.down.circle"
        case .power: return "bolt.circle"
        case .angle: return "angle"
        case .angularVelocity: return "goforward"
        case .area: return "square.on.square"
        case .concentration: return "drop"
        case .time: return "clock"
        case .electricChargeCapacity: return "bolt.horizontal.circle"
        case .electricCurrent: return "bolt"
        case .electricPotential: return "waveform.path.ecg"
        case .electricResistance: return "wave.3.right"
        case .energy: return "flame"
        case .frequency: return "waveform"
        case .fuelEfficiency: return "fuelpump"
        case .data: return "server.rack"
        }
    }
}
