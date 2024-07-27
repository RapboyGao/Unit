// ---------Power------------
public enum AUPower: AUnitProtocol, Identifiable {
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower

    public var coefficient: Double {
        switch self {
        case .terawatts: return 1_000_000_000_000.0
        case .gigawatts: return 1_000_000_000.0
        case .megawatts: return 1_000_000.0
        case .kilowatts: return 1000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1e-06
        case .nanowatts: return 1e-09
        case .picowatts: return 1e-12
        case .femtowatts: return 1e-15
        case .horsepower: return 745.6998715822702
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .terawatts: return .terawatts
        case .gigawatts: return .gigawatts
        case .megawatts: return .megawatts
        case .kilowatts: return .kilowatts
        case .watts: return .watts
        case .milliwatts: return .milliwatts
        case .microwatts: return .microwatts
        case .nanowatts: return .nanowatts
        case .picowatts: return .picowatts
        case .femtowatts: return .femtowatts
        case .horsepower: return .horsepower
        }
    }

    public static var baseUnit: AUPower = .watts

    public var id: AUPower { self }

    public func toBaseValue(value: Double) -> Double {
        return value * coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / coefficient
    }
}
