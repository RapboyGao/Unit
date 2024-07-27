// ---------Concentration------------
public enum AUConcentration: AUnitProtocol, Identifiable {
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion

    public var coefficient: Double {
        switch self {
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1e-06
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .gramsPerLiter: return .gramsPerLiter
        case .milligramsPerDeciliter: return .milligramsPerDeciliter
        case .partsPerMillion: return .partsPerMillion
        }
    }

    public static var baseUnit: AUConcentration = .gramsPerLiter

    public var id: AUConcentration { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
