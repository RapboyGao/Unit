### Nom du fichier README français

Le fichier README en français peut être nommé `README.fr.md` ou `README_FR.md`.

### README.fr.md

# AUnit README.md

## Français

### Introduction

Le package `AUnit` fournit un système complet pour travailler avec les unités de mesure. Il inclut la prise en charge de divers types d'unités, la conversion entre unités et les calculs de mesure. Ce package est idéal pour les développeurs qui doivent gérer différentes unités de mesure dans leurs applications.

### Installation

Pour installer le package `AUnit`, ajoutez ce qui suit à votre fichier `Package.swift` :

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### Utilisation

#### Importation du package

Tout d'abord, importez le package dans votre fichier Swift :

```swift
import AUnit
```

#### Définition des unités

Vous pouvez définir différents types d'unités en utilisant les énumérations `AUnitType` et `AUnit`. Par exemple :

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### Travailler avec les mesures

Créez une mesure avec une valeur spécifique et une unité :

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 mètres
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### Conversion d'unités

Convertissez une mesure en une autre unité :

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("Distance : \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // Distance : 0.1 kilomètre
}
```

#### Addition des mesures

Tout d'abord, définissez deux mesures :

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 mètres
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 mètres
```

Ensuite, ajoutez ces deux mesures ensemble :

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("Distance totale : \(totalDistance.value) \(totalDistance.unit.symbol)")  // Distance totale : 600 mètres
}
```

Ajoutez une différence de température à une température :

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // Différence de 10°C
if let newTemperature = temperature.adding(tempDifference) {
    print("Nouvelle température : \(newTemperature.value) \(newTemperature.unit.symbol)")  // Nouvelle température : 35°C
}
```

#### Soustraction des mesures

Tout d'abord, définissez deux mesures :

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 mètres
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 mètres
```

Ensuite, soustrayez une mesure d'une autre :

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("Distance restante : \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // Distance restante : 50 mètres
}
```

Soustrayez une différence de température d'une température :

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // Différence de 5°C
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("Température plus basse : \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // Température plus basse : 20°C
}
```

#### Multiplication des mesures

Tout d'abord, définissez deux mesures :

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 mètres
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 mètres
```

Ensuite, multipliez ces deux mesures ensemble :

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("Surface : \(area.value) \(area.unit.symbol)")  // Surface : 200 mètres carrés
}
```

Multipliez la puissance par le temps :

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 watts
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 heure
if let energy = power.multiplying(by: time) {
    print("Énergie : \(energy.value) \(energy.unit.symbol)")  // Énergie : 360000 joules
}
```

#### Division des mesures

Tout d'abord, définissez deux mesures :

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 mètres
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 secondes
```

Ensuite, divisez une mesure par une autre :

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("Vitesse : \(speed.value) \(speed.unit.symbol)")  // Vitesse : 10 mètres par seconde
}
```

Divisez l'énergie par le temps pour obtenir la puissance :

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 joules
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 heure
if let powerFromEnergy = energy.dividing(by: time) {
    print("Puissance : \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // Puissance : 100 watts
}
```

### Aperçu des unités (SwiftUI)

Si vous utilisez SwiftUI, vous pouvez prévisualiser la liste des unités :

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
