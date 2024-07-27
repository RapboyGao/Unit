// ---------Pressure------------
public enum AUPressure: AUnitProtocol, Identifiable {
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch

    public var coefficient: Double {
        switch self {
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1_000_000_000.0
        case .megapascals: return 1_000_000.0
        case .kilopascals: return 1000.0
        case .bars: return 100_000.0
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .hectopascals: return .hectopascals
        case .inchesOfMercury: return .inchesOfMercury
        case .millimetersOfMercury: return .millimetersOfMercury
        case .newtonsPerMetersSquared: return .newtonsPerMetersSquared
        case .gigapascals: return .gigapascals
        case .megapascals: return .megapascals
        case .kilopascals: return .kilopascals
        case .bars: return .bars
        case .millibars: return .millibars
        case .poundsForcePerSquareInch: return .poundsForcePerSquareInch
        }
    }

    public static var baseUnit: AUPressure = .newtonsPerMetersSquared

    public var id: AUPressure { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
