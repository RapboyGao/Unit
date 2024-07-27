// ---------Data------------
public enum AUData: AUnitProtocol, Identifiable {
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits

    public var coefficient: Double {
        switch self {
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1e+24
        case .zettabytes: return 1e+21
        case .exabytes: return 1e+18
        case .petabytes: return 1_000_000_000_000_000.0
        case .terabytes: return 1_000_000_000_000.0
        case .gigabytes: return 1_000_000_000.0
        case .megabytes: return 1_000_000.0
        case .kilobytes: return 1000.0
        case .yottabits: return 1.25e+23
        case .zettabits: return 1.25e+20
        case .exabits: return 1.25e+17
        case .petabits: return 125_000_000_000_000.0
        case .terabits: return 125_000_000_000.0
        case .gigabits: return 125_000_000.0
        case .megabits: return 125_000.0
        case .kilobits: return 125.0
        case .yobibytes: return 1.2089258196146292e+24
        case .zebibytes: return 1.1805916207174113e+21
        case .exbibytes: return 1.152921504606847e+18
        case .pebibytes: return 1_125_899_906_842_624.0
        case .tebibytes: return 1_099_511_627_776.0
        case .gibibytes: return 1_073_741_824.0
        case .mebibytes: return 1_048_576.0
        case .kibibytes: return 1024.0
        case .yobibits: return 1.5111572745182865e+23
        case .zebibits: return 1.4757395258967641e+20
        case .exbibits: return 1.4411518807585587e+17
        case .pebibits: return 140_737_488_355_328.0
        case .tebibits: return 137_438_953_472.0
        case .gibibits: return 134_217_728.0
        case .mebibits: return 131_072.0
        case .kibibits: return 128.0
        }
    }

    public var aUnit: AUnit {
        switch self {
        case .bytes: return .bytes
        case .bits: return .bits
        case .nibbles: return .nibbles
        case .yottabytes: return .yottabytes
        case .zettabytes: return .zettabytes
        case .exabytes: return .exabytes
        case .petabytes: return .petabytes
        case .terabytes: return .terabytes
        case .gigabytes: return .gigabytes
        case .megabytes: return .megabytes
        case .kilobytes: return .kilobytes
        case .yottabits: return .yottabits
        case .zettabits: return .zettabits
        case .exabits: return .exabits
        case .petabits: return .petabits
        case .terabits: return .terabits
        case .gigabits: return .gigabits
        case .megabits: return .megabits
        case .kilobits: return .kilobits
        case .yobibytes: return .yobibytes
        case .zebibytes: return .zebibytes
        case .exbibytes: return .exbibytes
        case .pebibytes: return .pebibytes
        case .tebibytes: return .tebibytes
        case .gibibytes: return .gibibytes
        case .mebibytes: return .mebibytes
        case .kibibytes: return .kibibytes
        case .yobibits: return .yobibits
        case .zebibits: return .zebibits
        case .exbibits: return .exbibits
        case .pebibits: return .pebibits
        case .tebibits: return .tebibits
        case .gibibits: return .gibibits
        case .mebibits: return .mebibits
        case .kibibits: return .kibibits
        }
    }

    public static var baseUnit: AUData = .bytes

    public var id: AUData { self }

    public func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    public func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}