
// ---------Acceleration------------
public enum AUAcceleration: AUnitProtocol, Identifiable {
    case metersPerSecondSquared, gravity

    public var coefficient: Double {
        switch self {
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .metersPerSecondSquared: return .metersPerSecondSquared
        case .gravity: return .gravity
        }
    }

    public static var baseUnit: AUAcceleration = .metersPerSecondSquared

    public var id: AUAcceleration { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
