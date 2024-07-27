// ---------Time------------
public enum AUTime: AUnitProtocol, Identifiable {
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries

    public var coefficient: Double {
        switch self {
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1e-06
        case .nanoseconds: return 1e-09
        case .picoseconds: return 1e-12
        case .days: return 86400.0
        case .weeks: return 604_800.0
        case .years: return 31_557_600.0
        case .decades: return 315_576_000.0
        case .centuries: return 3_155_760_000.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .hours: return .hours
        case .minutes: return .minutes
        case .seconds: return .seconds
        case .milliseconds: return .milliseconds
        case .microseconds: return .microseconds
        case .nanoseconds: return .nanoseconds
        case .picoseconds: return .picoseconds
        case .days: return .days
        case .weeks: return .weeks
        case .years: return .years
        case .decades: return .decades
        case .centuries: return .centuries
        }
    }

    public static var baseUnit: AUTime = .seconds

    public var id: AUTime { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
