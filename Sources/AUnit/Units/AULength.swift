// ---------Length------------
public enum AULength: AUnitProtocol, Identifiable {
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs

    public var coefficient: Double {
        switch self {
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1_000_000.0
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1e-06
        case .nanometers: return 1e-09
        case .picometers: return 1e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 10000.0
        case .lightyears: return 9.4607304725808e+15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 149_597_870_700.0
        case .parsecs: return 3.085677581491367e+16
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .feet: return .feet
        case .nauticalMiles: return .nauticalMiles
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .miles: return .miles
        case .megameters: return .megameters
        case .hectometers: return .hectometers
        case .decameters: return .decameters
        case .decimeters: return .decimeters
        case .centimeters: return .centimeters
        case .millimeters: return .millimeters
        case .micrometers: return .micrometers
        case .nanometers: return .nanometers
        case .picometers: return .picometers
        case .inches: return .inches
        case .yards: return .yards
        case .scandinavianMiles: return .scandinavianMiles
        case .lightyears: return .lightyears
        case .fathoms: return .fathoms
        case .furlongs: return .furlongs
        case .astronomicalUnits: return .astronomicalUnits
        case .parsecs: return .parsecs
        }
    }

    public static var baseUnit: AULength = .meters

    public var id: AULength { self }

    public func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}