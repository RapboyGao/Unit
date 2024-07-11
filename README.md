# AUnit Library

AUnit is a Swift library for handling various unit types and performing conversions between them. It includes support for length, speed, pressure, temperature, mass, volume, and more. The library provides enums to represent these units and their types, and allows for easy conversion and manipulation of measurements.

## Features

- Support for a wide range of unit types including length, speed, pressure, temperature, mass, volume, and more.
- Easy conversion between different units of the same type.
- Struct to represent measurements with a specific value and unit.
- Arithmetic operations for measurements (addition, subtraction, multiplication, division).
- Codable and Sendable support for enums and structs.

## Installation

You can add AUnit to your project using Swift Package Manager. Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

Then, include the library in your target:

```swift
.target(
    name: "YourTargetName",
    dependencies: ["AUnit"]),
```

## Usage

### Enum `AUnitType`

The `AUnitType` enum represents the types of units.

```swift
import AUnit

let lengthType: AUnitType = .length
print(lengthType.symbol)  // Outputs the symbol for the length unit type
```

### Enum `AUnit`

The `AUnit` enum represents various units.

```swift
import AUnit

let meterUnit: AUnit = .meters
print(meterUnit.coefficient)  // Outputs 1.0
```

### Struct `AMeasurement`

The `AMeasurement` struct represents a measurement with a specific value and unit.

```swift
import AUnit

let distance = AMeasurement(value: 100, unit: .meters)
let convertedDistance = distance.converted(to: .kilometers)
print(convertedDistance?.description)  // Outputs "0.1 km"
```

## Examples

### Converting Units

Convert a measurement from meters to kilometers:

```swift
let distance = AMeasurement(value: 1000, unit: .meters)
if let convertedDistance = distance.converted(to: .kilometers) {
    print(convertedDistance)  // Outputs "1.0 km"
}
```

### Adding Measurements

Add two measurements together:

```swift
let length1 = AMeasurement(value: 100, unit: .meters)
let length2 = AMeasurement(value: 1, unit: .kilometers)
if let totalLength = length1.adding(length2) {
    print(totalLength)  // Outputs "1100.0 meters"
}
```

### Subtracting Measurements

Subtract one measurement from another:

```swift
let length1 = AMeasurement(value: 1000, unit: .meters)
let length2 = AMeasurement(value: 1, unit: .kilometers)
if let remainingLength = length1.subtracting(length2) {
    print(remainingLength)  // Outputs "0.0 meters"
}
```

### Multiplying Measurements

Multiply two measurements:

```swift
let length = AMeasurement(value: 100, unit: .meters)
let width = AMeasurement(value: 2, unit: .meters)
if let area = length.multiplying(by: width) {
    print(area)  // Outputs "200.0 square meters"
}
```

### Dividing Measurements

Divide one measurement by another:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
let time = AMeasurement(value: 10, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print(speed)  // Outputs "10.0 meters per second"
}
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any feature requests or bug reports.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
