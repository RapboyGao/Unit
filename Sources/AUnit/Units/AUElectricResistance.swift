// ---------ElectricResistance------------
public enum AUElectricResistance: AUnitProtocol, Identifiable {
    case megaohms, kiloohms, ohms, milliohms, microohms

    public var coefficient: Double {
        switch self {
        case .megaohms: return 1_000_000.0
        case .kiloohms: return 1000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1e-06
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .megaohms: return .megaohms
        case .kiloohms: return .kiloohms
        case .ohms: return .ohms
        case .milliohms: return .milliohms
        case .microohms: return .microohms
        }
    }

    public static var baseUnit: AUElectricResistance = .ohms

    public var id: AUElectricResistance { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
