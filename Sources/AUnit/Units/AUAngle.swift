// ---------Angle------------
public enum AUAngle: AUnitProtocol, Identifiable {
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions

    public var coefficient: Double {
        switch self {
        case .degrees: return 1.0
        case .arcMinutes: return 0.016666666666666666
        case .arcSeconds: return 0.0002777777777777778
        case .radians: return 57.29577951308232
        case .gradians: return 0.9
        case .revolutions: return 360.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .degrees: return .degrees
        case .arcMinutes: return .arcMinutes
        case .arcSeconds: return .arcSeconds
        case .radians: return .radians
        case .gradians: return .gradians
        case .revolutions: return .revolutions
        }
    }

    public static var baseUnit: AUAngle = .degrees

    public var id: AUAngle { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
