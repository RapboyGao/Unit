# AUnit

## Languages

- [English](README.md)
- [中文 (Simplified Chinese)](README.zh.md)
- [繁體中文 (Traditional Chinese)](README.zh-TW.md)
- [日本語 (Japanese)](README.ja.md)
- [한국어 (Korean)](README.ko.md)
- [Français (French)](README.fr.md)
- [Deutsch (German)](README.de.md)

### Introduction

The `AUnit` package provides a comprehensive system for working with units of measurement. It includes support for various unit types, conversion between units, and measurement calculations. This package is ideal for developers needing to handle different units of measurement in their applications.

### Installation

To install the `AUnit` package, add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### Usage

#### Importing the Package

First, import the package into your Swift file:

```swift
import AUnit
```

#### Defining Units

You can define different types of units using the `AUnitType` and `AUnit` enums. For example:

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### Working with Measurements

Create a measurement with a specific value and unit:

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 meters
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### Unit Conversion

Convert a measurement to another unit:

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("Distance: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // Distance: 0.1 km
}
```

#### Adding Measurements

First, define two measurements:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 meters
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 meters
```

Then, add these two measurements together:

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("Total Distance: \(totalDistance.value) \(totalDistance.unit.symbol)")  // Total Distance: 600 meters
}
```

Add a temperature difference to a temperature:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // 10°C difference
if let newTemperature = temperature.adding(tempDifference) {
    print("New Temperature: \(newTemperature.value) \(newTemperature.unit.symbol)")  // New Temperature: 35°C
}
```

#### Subtracting Measurements

First, define two measurements:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 meters
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 meters
```

Then, subtract one measurement from another:

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("Remaining Distance: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // Remaining Distance: 50 meters
}
```

Subtract a temperature difference from a temperature:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // 5°C difference
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("Cooler Temperature: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // Cooler Temperature: 20°C
}
```

#### Multiplying Measurements

First, define two measurements:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 meters
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 meters
```

Then, multiply these two measurements together:

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("Area: \(area.value) \(area.unit.symbol)")  // Area: 200 square meters
}
```

Multiply power by time:

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 watts
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 hour
if let energy = power.multiplying(by: time) {
    print("Energy: \(energy.value) \(energy.unit.symbol)")  // Energy: 360000 joules
}
```

#### Dividing Measurements

First, define two measurements:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 meters
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 seconds
```

Then, divide one measurement by another:

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("Speed: \(speed.value) \(speed.unit.symbol)")  // Speed: 10 meters per second
}
```

Divide energy by time to get power:

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 joules
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 hour
if let powerFromEnergy = energy.dividing(by: time) {
    print("Power: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // Power: 100 watts
}
```

### Previewing Units (SwiftUI)

If you are using SwiftUI, you can preview the list of units:

```swift
import SwiftUI
import AUnit

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct UnitPreview: View {
    var body: some View {
        List {
            ForEach(AUnit.allCases, id: \.self) { unit in
                Text("\(unit.symbol) / \(unit.shortName) / \(unit.longName)")
            }
        }
    }
}

#Preview {
    UnitPreview()
}
```
