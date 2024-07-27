// ---------Mass------------
public enum AUMass: AUnitProtocol, Identifiable {
    case metricTons, shortTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, stones, carats, ouncesTroy, slugs

    public var coefficient: Double {
        switch self {
        case .metricTons: return 1_000_000.0
        case .shortTons: return 907_184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 453_592.37
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1e-06
        case .nanograms: return 1e-09
        case .picograms: return 1e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .metricTons: return .metricTons
        case .shortTons: return .shortTons
        case .kilograms: return .kilograms
        case .kilopounds: return .kilopounds
        case .pounds: return .pounds
        case .ounces: return .ounces
        case .grams: return .grams
        case .decigrams: return .decigrams
        case .centigrams: return .centigrams
        case .milligrams: return .milligrams
        case .micrograms: return .micrograms
        case .nanograms: return .nanograms
        case .picograms: return .picograms
        case .stones: return .stones
        case .carats: return .carats
        case .ouncesTroy: return .ouncesTroy
        case .slugs: return .slugs
        }
    }

    public static var baseUnit: AUMass = .grams

    public var id: AUMass { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
