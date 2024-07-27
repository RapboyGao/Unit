// ---------TemperatureDifference------------
public enum AUTemperatureDifference: AUnitProtocol, Identifiable {
    case celsiusDelta, fahrenheitDelta

    public var coefficient: Double {
        switch self {
        case .celsiusDelta: return 1.0
        case .fahrenheitDelta: return 0.5555555555555556
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .celsiusDelta: return .celsiusDelta
        case .fahrenheitDelta: return .fahrenheitDelta
        }
    }

    public static var baseUnit: AUTemperatureDifference = .celsiusDelta

    public var id: AUTemperatureDifference { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
