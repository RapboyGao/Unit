// ---------ElectricCurrent------------
public enum AUElectricCurrent: AUnitProtocol, Identifiable {
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes

    public var coefficient: Double {
        switch self {
        case .megaamperes: return 1_000_000.0
        case .kiloamperes: return 1000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1e-06
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .megaamperes: return .megaamperes
        case .kiloamperes: return .kiloamperes
        case .amperes: return .amperes
        case .milliamperes: return .milliamperes
        case .microamperes: return .microamperes
        }
    }

    public static var baseUnit: AUElectricCurrent = .amperes

    public var id: AUElectricCurrent { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
