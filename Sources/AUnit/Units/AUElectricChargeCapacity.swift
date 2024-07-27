// ---------ElectricChargeCapacity------------
public enum AUElectricChargeCapacity: AUnitProtocol, Identifiable {
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, coulombs

    public var coefficient: Double {
        switch self {
        case .megaampereHours: return 3_600_000_000.0
        case .kiloampereHours: return 3_600_000.0
        case .ampereHours: return 3600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .coulombs: return 1.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .megaampereHours: return .megaampereHours
        case .kiloampereHours: return .kiloampereHours
        case .ampereHours: return .ampereHours
        case .milliampereHours: return .milliampereHours
        case .microampereHours: return .microampereHours
        case .coulombs: return .coulombs
        }
    }

    public static var baseUnit: AUElectricChargeCapacity = .coulombs

    public var id: AUElectricChargeCapacity { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
