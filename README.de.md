# AUnit

## Deutsch

### Einführung

Das `AUnit`-Paket bietet ein umfassendes System zur Arbeit mit Maßeinheiten. Es unterstützt verschiedene Einheitstypen, die Umrechnung zwischen Einheiten und die Berechnung von Messwerten. Dieses Paket ist ideal für Entwickler, die in ihren Anwendungen mit verschiedenen Maßeinheiten umgehen müssen.

### Installation

Um das `AUnit`-Paket zu installieren, fügen Sie Folgendes zu Ihrer `Package.swift` hinzu:

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### Nutzung

#### Paket importieren

Zuerst importieren Sie das Paket in Ihre Swift-Datei:

```swift
import AUnit
```

#### Einheiten definieren

Sie können verschiedene Einheitstypen mit den Enums `AUnitType` und `AUnit` definieren. Zum Beispiel:

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### Arbeiten mit Messungen

Erstellen Sie eine Messung mit einem bestimmten Wert und einer Einheit:

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 Meter
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### Einheiten umrechnen

Rechnen Sie eine Messung in eine andere Einheit um:

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("Entfernung: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // Entfernung: 0.1 Kilometer
}
```

#### Messungen addieren

Definieren Sie zuerst zwei Messungen:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 Meter
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 Meter
```

Addieren Sie dann diese beiden Messungen:

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("Gesamtentfernung: \(totalDistance.value) \(totalDistance.unit.symbol)")  // Gesamtentfernung: 600 Meter
}
```

Fügen Sie eine Temperaturdifferenz zu einer Temperatur hinzu:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // Differenz von 10°C
if let newTemperature = temperature.adding(tempDifference) {
    print("Neue Temperatur: \(newTemperature.value) \(newTemperature.unit.symbol)")  // Neue Temperatur: 35°C
}
```

#### Messungen subtrahieren

Definieren Sie zuerst zwei Messungen:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 Meter
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 Meter
```

Subtrahieren Sie dann eine Messung von der anderen:

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("Restentfernung: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // Restentfernung: 50 Meter
}
```

Subtrahieren Sie eine Temperaturdifferenz von einer Temperatur:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // Differenz von 5°C
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("Niedrigere Temperatur: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // Niedrigere Temperatur: 20°C
}
```

#### Messungen multiplizieren

Definieren Sie zuerst zwei Messungen:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 Meter
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 Meter
```

Multiplizieren Sie dann diese beiden Messungen:

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("Fläche: \(area.value) \(area.unit.symbol)")  // Fläche: 200 Quadratmeter
}
```

Multiplizieren Sie Leistung mit Zeit:

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 Watt
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 Stunde
if let energy = power.multiplying(by: time) {
    print("Energie: \(energy.value) \(energy.unit.symbol)")  // Energie: 360000 Joule
}
```

#### Messungen dividieren

Definieren Sie zuerst zwei Messungen:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 Meter
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 Sekunden
```

Dividieren Sie dann eine Messung durch eine andere:

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("Geschwindigkeit: \(speed.value) \(speed.unit.symbol)")  // Geschwindigkeit: 10 Meter pro Sekunde
}
```

Dividieren Sie Energie durch Zeit, um Leistung zu erhalten:

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 Joule
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 Stunde
if let powerFromEnergy = energy.dividing(by: time) {
    print("Leistung: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // Leistung: 100 Watt
}
```

### Vorschau der Einheiten (SwiftUI)

Wenn Sie SwiftUI verwenden, können Sie die Liste der Einheiten anzeigen:

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
