// ---------ElectricPotential------------
public enum AUElectricPotential: AUnitProtocol, Identifiable {
    case megavolts, kilovolts, volts, millivolts, microvolts

    public var coefficient: Double {
        switch self {
        case .megavolts: return 1_000_000.0
        case .kilovolts: return 1000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1e-06
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .megavolts: return .megavolts
        case .kilovolts: return .kilovolts
        case .volts: return .volts
        case .millivolts: return .millivolts
        case .microvolts: return .microvolts
        }
    }

    public static var baseUnit: AUElectricPotential = .volts

    public var id: AUElectricPotential { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
