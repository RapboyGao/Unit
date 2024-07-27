public enum AUSpeed: AUnitProtocol, Identifiable {
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond

    public var coefficient: Double {
        switch self {
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .knots: return .knots
        case .metersPerSecond: return .metersPerSecond
        case .feetPerMinute: return .feetPerMinute
        case .kilometersPerHour: return .kilometersPerHour
        case .feetPerSecond: return .feetPerSecond
        case .milesPerHour: return .milesPerHour
        case .inchesPerSecond: return .inchesPerSecond
        case .yardsPerSecond: return .yardsPerSecond
        }
    }

    public static var baseUnit: AUSpeed = .metersPerSecond

    public var id: AUSpeed { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
