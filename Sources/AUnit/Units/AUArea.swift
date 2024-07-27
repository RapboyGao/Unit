// ---------Area------------
public enum AUArea: AUnitProtocol, Identifiable {
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares

    public var coefficient: Double {
        switch self {
        case .squareMegameters: return 1_000_000_000_000.0
        case .squareKilometers: return 1_000_000.0
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1e-06
        case .squareMicrometers: return 1e-12
        case .squareNanometers: return 1e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.09290304
        case .squareYards: return 0.83612736
        case .squareMiles: return 2_589_988.110336
        case .acres: return 4046.8564224
        case .ares: return 100.0
        case .hectares: return 10000.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .squareMegameters: return .squareMegameters
        case .squareKilometers: return .squareKilometers
        case .squareMeters: return .squareMeters
        case .squareCentimeters: return .squareCentimeters
        case .squareMillimeters: return .squareMillimeters
        case .squareMicrometers: return .squareMicrometers
        case .squareNanometers: return .squareNanometers
        case .squareInches: return .squareInches
        case .squareFeet: return .squareFeet
        case .squareYards: return .squareYards
        case .squareMiles: return .squareMiles
        case .acres: return .acres
        case .ares: return .ares
        case .hectares: return .hectares
        }
    }

    public static var baseUnit: AUArea = .squareMeters

    public var id: AUArea { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
