# AUnit

## Quick Links

- [English](#english)
- [简体中文](#简体中文)
- [繁體中文](#繁體中文)
- [日本語](#日本語)
- [Deutsch](#deutsch)
- [Français](#français)
- [Español](#español)
- [한국어](#한국어)

---

## English

### Overview

Welcome to AUnit, a versatile Swift package designed to simplify unit conversion and localization for your applications. Whether you're dealing with lengths, speeds, pressures, temperatures, or any other unit types, AUnit has got you covered. With support for a wide range of unit types and seamless integration with Swift's localization features, AUnit ensures that your measurements are accurate and meaningful across different locales.

### Installation

You can install AUnit via Swift Package Manager. Add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### Usage

#### Importing the Package

```swift
import AUnit
```

#### Example Code

##### Measurement Conversion

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) is \(converted)") // 100 °C is 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) is \(convertedSpeed)") // 60 mph is 96.5606 km/h
}
```

##### Adding Measurements

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 hr + 30 min = 1.5 hr
}
```

##### Subtracting Measurements

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### Multiplying Measurements

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 m²
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 W * 2 hr = 20 Wh
}
```

##### Dividing Measurements

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 m / 10 s = 10 m/s
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 J / 50 s = 10 W
}
```

---

## 简体中文

### 概述

欢迎使用 AUnit，一个多功能的 Swift 包，旨在简化您的应用程序中的单位转换和本地化工作。无论您处理的是长度、速度、压力、温度或其他任何单位类型，AUnit 都能满足您的需求。AUnit 支持广泛的单位类型，并与 Swift 的本地化功能无缝集成，确保您的测量在不同的语言环境中都准确无误。

### 安装

您可以通过 Swift Package Manager 安装 AUnit。将以下依赖项添加到您的 `Package.swift` 文件中：

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### 用法

#### 导入包

```swift
import AUnit
```

#### 示例代码

##### 单位转换

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) 是 \(converted)") // 100 °C 是 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) 是 \(convertedSpeed)") // 60 mph 是 96.5606 km/h
}
```

##### 测量值相加

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 小时 + 30 分钟 = 1.5 小时
}
```

##### 测量值相减

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### 测量值相乘

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 平方米
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 瓦 * 2 小时 = 20 瓦时
}
```

##### 测量值相除

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 米 / 10 秒 = 10 米/秒
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 焦耳 / 50 秒 = 10 瓦
}
```

---

## 繁體中文

### 概述

歡迎使用 AUnit，一個多功能的 Swift 包，旨在簡化您的應用程序中的單位轉換和本地化工作。無論您處

理的是長度、速度、壓力、溫度或其他任何單位類型，AUnit 都能滿足您的需求。AUnit 支持廣泛的單位類型，並與 Swift 的本地化功能無縫集成，確保您的測量在不同的語言環境中都準確無誤。

### 安裝

您可以通過 Swift Package Manager 安裝 AUnit。將以下依賴項添加到您的 `Package.swift` 文件中：

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### 用法

#### 導入包

```swift
import AUnit
```

#### 示例代碼

##### 單位轉換

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) 是 \(converted)") // 100 °C 是 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) 是 \(convertedSpeed)") // 60 mph 是 96.5606 km/h
}
```

##### 測量值相加

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 小時 + 30 分鐘 = 1.5 小時
}
```

##### 測量值相減

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### 測量值相乘

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 平方米
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 瓦 * 2 小時 = 20 瓦時
}
```

##### 測量值相除

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 米 / 10 秒 = 10 米/秒
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 焦耳 / 50 秒 = 10 瓦
}
```

---

## 日本語

### 概要

AUnit は、単位変換とローカリゼーション用の Swift パッケージです。長さ、速度、圧力、温度など、さまざまな単位タイプをサポートしています。AUnit は、さまざまな単位タイプをサポートし、Swift のローカリゼーション機能とシームレスに統合されています。これにより、異なるロケールでの測定が正確で意味のあるものになります。

### インストール

AUnit を Swift Package Manager 経由でインストールできます。`Package.swift` ファイルに以下の依存関係を追加してください：

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### 使用方法

#### パッケージのインポート

```swift
import AUnit
```

#### サンプルコード

##### 単位変換

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) は \(converted) です") // 100 °C は 212 °F です
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) は \(convertedSpeed) です") // 60 mph は 96.5606 km/h です
}
```

##### 測定値の加算

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 時間 + 30 分 = 1.5 時間
}
```

##### 測定値の減算

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### 測定値の乗算

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 平方メートル
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 ワット * 2 時間 = 20 ワット時
}
```

##### 測定値の除算

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 メートル / 10 秒 = 10 メートル/秒
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 ジュール / 50 秒 = 10 ワット
}
```

---

## Deutsch

### Überblick

AUnit ist ein vielseitiges Swift-Paket, das die Umrechnung und Lokalisierung von Einheiten in Ihren Anwendungen vereinfacht. Egal ob Längen, Geschwindigkeiten, Drücke, Temperaturen oder andere Einheitentypen, A

Unit bietet umfassende Unterstützung. Mit einer breiten Palette von Einheitentypen und nahtloser Integration in die Lokalisierungsfunktionen von Swift sorgt AUnit dafür, dass Ihre Messungen in verschiedenen Sprachen und Regionen genau und verständlich sind.

### Installation

Sie können AUnit über den Swift Package Manager installieren. Fügen Sie die folgende Abhängigkeit zu Ihrer `Package.swift`-Datei hinzu:

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### Verwendung

#### Importieren des Pakets

```swift
import AUnit
```

#### Beispielcode

##### Einheitenumrechnung

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) ist \(converted)") // 100 °C ist 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) ist \(convertedSpeed)") // 60 mph sind 96.5606 km/h
}
```

##### Messen hinzufügen

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 Stunde + 30 Minuten = 1.5 Stunden
}
```

##### Messen subtrahieren

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### Messen multiplizieren

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 Quadratmeter
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 Watt * 2 Stunden = 20 Wattstunden
}
```

##### Messen teilen

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 Meter / 10 Sekunden = 10 Meter/Sekunde
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 Joule / 50 Sekunden = 10 Watt
}
```

---

## Français

### Vue d'ensemble

Bienvenue à AUnit, un package Swift polyvalent conçu pour simplifier la conversion et la localisation des unités dans vos applications. Que vous traitiez des longueurs, des vitesses, des pressions, des températures ou tout autre type d'unité, AUnit vous couvre. Avec la prise en charge d'une large gamme de types d'unités et une intégration transparente avec les fonctionnalités de localisation de Swift, AUnit garantit que vos mesures sont précises et significatives dans différentes langues et régions.

### Installation

Vous pouvez installer AUnit via Swift Package Manager. Ajoutez la dépendance suivante à votre fichier `Package.swift` :

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### Utilisation

#### Importation du Package

```swift
import AUnit
```

#### Exemple de Code

##### Conversion des Mesures

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) est \(converted)") // 100 °C est 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) est \(convertedSpeed)") // 60 mph est 96.5606 km/h
}
```

##### Additionner les Mesures

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 heure + 30 minutes = 1.5 heure
}
```

##### Soustraire les Mesures

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### Multiplier les Mesures

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 mètres carrés
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 watts * 2 heures = 20 wattheures
}
```

##### Diviser les Mesures

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 mètres / 10 secondes = 10 mètres/seconde
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 joules / 50 secondes = 10 watts
}
```

---

## Español

### Descripción General

Bienvenido a AUnit, un paquete versátil de Swift diseñado para simplificar la conversión y localización de unidades en tus aplicaciones. Ya sea que estés tratando con longitudes, velocidades, presiones, temperaturas u otros tipos de unidades, AUnit te tiene cubierto. Con soporte para una amplia gama de tipos de unidades e integración perfecta con las funciones de localización de Swift, AUnit garantiza que tus mediciones sean precisas y significativas en diferentes idiomas y regiones.

### Instalación

Puedes instalar AUnit a través del Swift Package Manager. Agrega la siguiente dependencia a tu archivo `Package.swift`:

```swift
.package(url: "https://github.com/RapboyGao/Unit.git",

 from: "1.0.0")
```

### Uso

#### Importando el Paquete

```swift
import AUnit
```

#### Código de Ejemplo

##### Conversión de Medidas

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) es \(converted)") // 100 °C es 212 °F
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) es \(convertedSpeed)") // 60 mph es 96.5606 km/h
}
```

##### Sumar Medidas

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 hora + 30 minutos = 1.5 horas
}
```

##### Restar Medidas

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### Multiplicar Medidas

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 metros cuadrados
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 vatios * 2 horas = 20 vatios-hora
}
```

##### Dividir Medidas

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 metros / 10 segundos = 10 metros/segundo
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 julios / 50 segundos = 10 vatios
}
```

---

## 한국어

### 개요

AUnit에 오신 것을 환영합니다. AUnit은 다양한 단위 변환 및 로컬라이제이션을 지원하는 다재다능한 Swift 패키지입니다. 길이, 속도, 압력, 온도 등 다양한 단위 타입을 처리할 때 AUnit이 도와드리겠습니다. AUnit은 다양한 단위 타입을 지원하며 Swift의 로컬라이제이션 기능과 매끄럽게 통합되어, 다양한 언어 및 지역에서 측정이 정확하고 의미 있게 해줍니다.

### 설치

AUnit은 Swift Package Manager를 통해 설치할 수 있습니다. `Package.swift` 파일에 다음 종속성을 추가하세요:

```swift
.package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
```

### 사용법

#### 패키지 임포트

```swift
import AUnit
```

#### 예제 코드

##### 측정값 변환

```swift
let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("\(measurement) 는 \(converted) 입니다") // 100 °C 는 212 °F 입니다
}

let speed = AMeasurement(value: 60, unit: .milesPerHour)
if let convertedSpeed = speed.converted(to: .kilometersPerHour) {
    print("\(speed) 는 \(convertedSpeed) 입니다") // 60 mph 는 96.5606 km/h 입니다
}
```

##### 측정값 더하기

```swift
let length1 = AMeasurement(value: 50, unit: .meters)
let length2 = AMeasurement(value: 50, unit: .meters)
if let result = length1.adding(length2) {
    print("\(length1) + \(length2) = \(result)") // 50 m + 50 m = 100 m
}

let time1 = AMeasurement(value: 1, unit: .hours)
let time2 = AMeasurement(value: 30, unit: .minutes)
if let result = time1.adding(time2) {
    print("\(time1) + \(time2) = \(result)") // 1 시간 + 30 분 = 1.5 시간
}
```

##### 측정값 빼기

```swift
let distance1 = AMeasurement(value: 100, unit: .kilometers)
let distance2 = AMeasurement(value: 40, unit: .kilometers)
if let result = distance1.subtracting(distance2) {
    print("\(distance1) - \(distance2) = \(result)") // 100 km - 40 km = 60 km
}

let mass1 = AMeasurement(value: 1000, unit: .grams)
let mass2 = AMeasurement(value: 200, unit: .grams)
if let result = mass1.subtracting(mass2) {
    print("\(mass1) - \(mass2) = \(result)") // 1000 g - 200 g = 800 g
}
```

##### 측정값 곱하기

```swift
let area1 = AMeasurement(value: 5, unit: .meters)
let area2 = AMeasurement(value: 4, unit: .meters)
if let result = area1.multiplying(by: area2) {
    print("\(area1) * \(area2) = \(result)") // 5 m * 4 m = 20 제곱미터
}

let power1 = AMeasurement(value: 10, unit: .watts)
let time = AMeasurement(value: 2, unit: .hours)
if let result = power1.multiplying(by: time) {
    print("\(power1) * \(time) = \(result)") // 10 와트 * 2 시간 = 20 와트시
}
```

##### 측정값 나누기

```swift
let speed1 = AMeasurement(value: 100, unit: .meters)
let time1 = AMeasurement(value: 10, unit: .seconds)
if let result = speed1.dividing(by: time1) {
    print("\(speed1) / \(time1) = \(result)") // 100 미터 / 10 초 = 10 미터/초
}

let energy = AMeasurement(value: 500, unit: .joules)
let time2 = AMeasurement(value: 50, unit: .seconds)
if let result = energy.dividing(by: time2) {
    print("\(energy) / \(time2) = \(result)") // 500 줄 / 50 초 = 10 와트
}
```
