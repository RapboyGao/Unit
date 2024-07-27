// ---------Energy------------
public enum AUEnergy: AUnitProtocol, Identifiable {
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours

    public var coefficient: Double {
        switch self {
        case .kilojoules: return 1000.0
        case .joules: return 1.0
        case .kilocalories: return 4184.0
        case .calories: return 4.184
        case .kilowattHours: return 3_600_000.0
        case .wattHours: return 3600.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .kilojoules: return .kilojoules
        case .joules: return .joules
        case .kilocalories: return .kilocalories
        case .calories: return .calories
        case .kilowattHours: return .kilowattHours
        case .wattHours: return .wattHours
        }
    }

    public static var baseUnit: AUEnergy = .joules

    public var id: AUEnergy { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
