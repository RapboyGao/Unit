// ---------AngularVelocity------------
public enum AUAngularVelocity: AUnitProtocol, Identifiable {
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond

    public var coefficient: Double {
        switch self {
        case .radiansPerSecond: return 57.29577951308232
        case .degreesPerSecond: return 1.0
        case .revolutionsPerMinute: return 6.0
        case .revolutionsPerSecond: return 360.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .radiansPerSecond: return .radiansPerSecond
        case .degreesPerSecond: return .degreesPerSecond
        case .revolutionsPerMinute: return .revolutionsPerMinute
        case .revolutionsPerSecond: return .revolutionsPerSecond
        }
    }

    public static var baseUnit: AUAngularVelocity = .degreesPerSecond

    public var id: AUAngularVelocity { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
