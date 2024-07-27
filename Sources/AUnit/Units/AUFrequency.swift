// ---------Frequency------------
public enum AUFrequency: AUnitProtocol, Identifiable {
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond

    public var coefficient: Double {
        switch self {
        case .terahertz: return 1_000_000_000_000.0
        case .gigahertz: return 1_000_000_000.0
        case .megahertz: return 1_000_000.0
        case .kilohertz: return 1000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1e-06
        case .nanohertz: return 1e-09
        case .framesPerSecond: return 1.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .terahertz: return .terahertz
        case .gigahertz: return .gigahertz
        case .megahertz: return .megahertz
        case .kilohertz: return .kilohertz
        case .hertz: return .hertz
        case .millihertz: return .millihertz
        case .microhertz: return .microhertz
        case .nanohertz: return .nanohertz
        case .framesPerSecond: return .framesPerSecond
        }
    }

    public static var baseUnit: AUFrequency = .hertz

    public var id: AUFrequency { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
