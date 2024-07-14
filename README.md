# AUnit

[简体中文](#简体中文) | [繁體中文](#繁體中文) | [日本語](#日本語) | [Français](#français) | [Deutsch](#deutsch) | [한국어](#한국어) | [Español](#español)

AUnit 是一个 Swift Package，用于处理不同单位之间的转换。该包包括多种单位类型和相应的转换函数，适用于科学计算、工程、数据处理等领域。

## 简体中文

### 功能

- 支持多种单位类型，包括长度、速度、压力、温度、质量、体积、功率等。
- 提供了单位间的转换功能。
- 支持 SwiftUI 视图组件，用于选择和显示单位。

### 安装

在 `Package.swift` 文件中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### 用法示例

#### 基本转换

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100摄氏度等于\(converted.value)华氏度") // 预期输出：100摄氏度等于212华氏度
}
```

#### 长度转换

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1米等于\(converted.value)千米") // 预期输出：1米等于0.001千米
}

if let converted = measurement.converted(to: .feet) {
    print("1米等于\(converted.value)英尺") // 预期输出：1米等于3.28084英尺
}
```

#### 速度转换

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("100千米/小时等于\(converted.value)米/秒") // 预期输出：100千米/小时等于27.7778米/秒
}

if let converted = speed.converted(to: .milesPerHour) {
    print("100千米/小时等于\(converted.value)英里/小时") // 预期输出：100千米/小时等于62.1371英里/小时
}
```

#### 使用 SwiftUI 组件

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### 批量转换示例

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) 等于 \(converted.value) 米")
    }
}
// 预期输出：
// 1 米 等于 1 米
// 1 千米 等于 1000 米
// 1 英尺 等于 0.3048 米
```

### 结构和枚举

#### AUnitType

`AUnitType` 枚举表示单位的类型，例如长度、速度、压力等。它包含以下属性：

- `symbol`: 单位类型的符号。
- `shortName`: 单位类型的短名称。
- `longName`: 单位类型的全名称。
- `detailedIntroduction`: 单位类型的详细介绍。
- `systemImage`: 单位类型的 SF Symbol 图标。

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

`AUnit` 枚举表示具体的单位，例如米、千米、米每秒、千克等。它包含以下属性：

- `unitType`: 单位所属的类型。
- `coefficient`: 单位转换的系数。
- `constant`: 单位转换的常数（用于温度转换）。
- `symbol`: 单位的符号。
- `shortName`: 单位的短名称。
- `longName`: 单位的全名称。
- `detailedIntroduction`: 单位的详细介绍。

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // 其他单位省略...
}
```

#### AMeasurement

`AMeasurement` 结构体表示一个测量值及其单位。它包含以下属性和方法：

- `value`: 测量的值。
- `unit`: 测量的单位。
- `init(value:unit:)`: 初始化一个测量值。
- `converted(to:)`: 将测量值转换为另一个单位。
- `adding(_:)`: 将另一个测量值添加到此测量值中。
- `subtracting(_:)`: 从此测量值中减去另一个测量值。
- `multiplying(by:)`: 将此测量值乘以另一个测量值。
- `dividing(by:)`: 将此测量值除以另一个测量值。

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // 其他方法省略...
}
```

### 加减乘除示例

#### 加法

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2米 + 3米 = \(result.value)米") // 预期输出：2米 + 3米 = 5米
}
```

#### 减法

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5米 - 3米 = \(result.value)米") // 预期输出：5米 - 3米 = 2米
}
```

#### 乘法

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5米 * 2 = \(result.value)米") // 预期输出：5米 * 2 = 10米
```

#### 除法

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10米 / 2 = \(result.value)米") // 预期输出：10米 / 2 = 5米
```

#### 复杂运算示例：速度乘以时间得到距离

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60米/秒 * 120秒 = \(distance.value)米") // 预期输出：60米/秒 * 120秒 = 7200米
}
```

#### 复杂运算示例：距离除以时间得到速度

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200米 / 120秒 = \(speed.value)米/秒") // 预期输出：7200米 / 120秒 = 60米/秒
}
```

## 繁體中文

### 功能

- 支援多種單位類型，包括長度、速度、壓力、溫度、質量、體積、功率等。
- 提供了單位間的轉換功能。
- 支援 SwiftUI 視圖組件，用於選擇和顯示單位。

### 安裝

在 `Package.swift` 文件中添加依賴：

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### 用法示例

#### 基本轉換

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100攝氏度等於\(converted.value)華氏度") // 預期輸出：100攝氏度等於212華氏度
}
```

#### 長度轉換

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1米等於\(converted.value)千米") // 預期輸出：1米等於0.001千米
}

if let converted = measurement.converted(to: .feet) {
    print("1米等於\(converted.value)英尺") // 預期輸出：1米等於3.28084英尺
}
```

#### 速度轉換

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("100千米/小時等於\(converted.value)米/秒") // 預期輸出：100千米/小時等於27.7778米/秒
}

if let converted = speed.converted(to: .milesPerHour) {
    print("100千米/小時等於\(converted.value)英里/小時") // 預期輸出：100千米/小時等於62.1371英里/小時
}
```

#### 使用 SwiftUI 組件

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### 批量轉換示例

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) 等於 \(converted.value) 米")
    }
}
// 預期輸出：
// 1 米 等於 1 米
// 1 千米 等於 1000 米
// 1 英尺 等於 0.3048 米
```

### 結構和枚舉

#### AUnitType

`AUnitType` 枚舉表示單位的類型，例如長度、速度、壓力等。它包含以下屬性：

- `symbol`: 單位類型的符號。
- `shortName`: 單位類型的短名稱。
- `longName`: 單位類型的全名稱。
- `detailedIntroduction`: 單位類型的詳細介紹。
- `systemImage`: 單位類型的 SF Symbol 圖標。

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

`AUnit` 枚舉表示具體的單位，例如米、千米、米每秒、千克等。它包含以下屬性：

- `unitType`: 單位所屬的類型。
- `coefficient`: 單位轉換的系數。
- `constant`: 單位轉換的常數（用於溫度轉換）。
- `symbol`: 單位的符號。
- `shortName`: 單位的短名稱。
- `longName`: 單位的全名稱。
- `detailedIntroduction`: 單位的詳細介紹。

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // 其他單位省略...
}
```

#### AMeasurement

`AMeasurement` 結構體表示一個測量值及其單位。它包含以下屬性和方法：

- `value`: 測量的值。
- `unit`: 測量的單位。
- `init(value:unit:)`: 初始化一個測量值。
- `converted(to:)`: 將測量值轉換為另一個單位。
- `adding(_:)`: 將另一個測量值添加到此測量值中。
- `subtracting(_:)`: 從此測量值中減去另一個測量值。
- `multiplying(by:)`: 將此測量值乘以另一個測量值。
- `dividing(by:)`: 將此測量值除以另一個測量值。

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // 其他方法省略...
}
```

### 加減乘除示例

#### 加法

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2米 + 3米 = \(result.value)米") // 預期輸出：2米 + 3米 = 5米
}
```

#### 減法

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5米 - 3米 = \(result.value)米") // 預期輸出：5米 - 3米 = 2米
}
```

#### 乘法

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5米 * 2 = \(result.value)米") // 預期輸出：5米 * 2 = 10米
```

#### 除法

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10米 / 2 = \(result.value)米") // 預期輸出：10米 / 2 = 5米
```

#### 複雜運算示例：速度乘以時間得到距離

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60米/秒 * 120秒 = \(distance.value)米") // 預期輸出：60米/秒 * 120秒 = 7200米
}
```

#### 複雜運算示例：距離除以時間得到速度

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200米 / 120秒 = \(speed.value)米/秒") // 預期輸出：7200米 / 120秒 = 60米/秒
}
```

## 日本語

### 機

能

- 長さ、速度、圧力、温度、質量、体積、電力などのさまざまな単位タイプをサポートします。
- 単位間の変換機能を提供します。
- 単位を選択および表示するための SwiftUI コンポーネントをサポートします。

### インストール

`Package.swift` ファイルに依存関係を追加します：

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### 使用例

#### 基本的な変換

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100度摂氏は華氏\(converted.value)度に相当します") // 予期出力：100度摂氏は華氏212度に相当します
}
```

#### 長さの変換

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1メートルは\(converted.value)キロメートルに相当します") // 予期出力：1メートルは0.001キロメートルに相当します
}

if let converted = measurement.converted(to: .feet) {
    print("1メートルは\(converted.value)フィートに相当します") // 予期出力：1メートルは3.28084フィートに相当します
}
```

#### 速度の変換

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("時速100キロメートルは毎秒\(converted.value)メートルに相当します") // 予期出力：時速100キロメートルは毎秒27.7778メートルに相当します
}

if let converted = speed.converted(to: .milesPerHour) {
    print("時速100キロメートルは時速\(converted.value)マイルに相当します") // 予期出力：時速100キロメートルは時速62.1371マイルに相当します
}
```

#### SwiftUI コンポーネントの使用

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### 複数の単位変換の例

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) は \(converted.value) メートルに相当します")
    }
}
// 予期出力：
// 1 メートル は 1 メートルに相当します
// 1 キロメートル は 1000 メートルに相当します
// 1 フィート は 0.3048 メートルに相当します
```

### 構造と列挙

#### AUnitType

`AUnitType` 列挙は、長さ、速度、圧力などの単位タイプを表します。以下のプロパティが含まれています：

- `symbol`: 単位タイプのシンボル。
- `shortName`: 単位タイプの短い名前。
- `longName`: 単位タイプの完全な名前。
- `detailedIntroduction`: 単位タイプの詳細な紹介。
- `systemImage`: 単位タイプの SF シンボルアイコン。

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

`AUnit` 列挙は、メートル、キロメートル、毎秒メートル、キログラムなどの具体的な単位を表します。以下のプロパティが含まれています：

- `unitType`: 単位の所属タイプ。
- `coefficient`: 単位変換の係数。
- `constant`: 単位変換の定数（温度変換に使用）。
- `symbol`: 単位のシンボル。
- `shortName`: 単位の短い名前。
- `longName`: 単位の完全な名前。
- `detailedIntroduction`: 単位の詳細な紹介。

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // その他の単位は省略...
}
```

#### AMeasurement

`AMeasurement` 構造体は、特定の値と単位を持つ測定を表します。以下のプロパティとメソッドが含まれています：

- `value`: 測定の値。
- `unit`: 測定の単位。
- `init(value:unit:)`: 測定値を初期化します。
- `converted(to:)`: 測定値を別の単位に変換します。
- `adding(_:)`: 他の測定値をこの測定値に追加します。
- `subtracting(_:)`: 他の測定値をこの測定値から減算します。
- `multiplying(by:)`: この測定値を他の測定値で掛けます。
- `dividing(by:)`: この測定値を他の測定値で割ります。

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // その他のメソッドは省略...
}
```

### 加減乘除示例

#### 加法

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2メートル + 3メートル = \(result.value)メートル") // 予期出力：2メートル + 3メートル = 5メートル
}
```

#### 減法

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5メートル - 3メートル = \(result.value)メートル") // 予期出力：5メートル - 3メートル = 2メートル
}
```

#### 乘法

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5メートル * 2 = \(result.value)メートル") // 予期出力：5メートル * 2 = 10メートル
```

#### 除法

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10メートル / 2 = \(result.value)メートル") // 予期出力：10メートル / 2 = 5メートル
```

#### 複雑な運算例：速度を時間で乘じて距離を求める

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)


let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60メートル/秒 * 120秒 = \(distance.value)メートル") // 予期出力：60メートル/秒 * 120秒 = 7200メートル
}
```

#### 複雑な運算例：距離を時間で除して速度を求める

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200メートル / 120秒 = \(speed.value)メートル/秒") // 予期出力：7200メートル / 120秒 = 60メートル/秒
}
```

## Français

### Fonctionnalités

- Prend en charge différents types d'unités, y compris la longueur, la vitesse, la pression, la température, la masse, le volume, la puissance, etc.
- Fournit des fonctionnalités de conversion entre unités.
- Prend en charge les composants SwiftUI pour sélectionner et afficher les unités.

### Installation

Ajoutez la dépendance dans le fichier `Package.swift` :

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### Exemple d'utilisation

#### Conversion de base

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100 degrés Celsius équivaut à \(converted.value) degrés Fahrenheit") // Résultat attendu : 100 degrés Celsius équivaut à 212 degrés Fahrenheit
}
```

#### Conversion de longueur

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1 mètre équivaut à \(converted.value) kilomètres") // Résultat attendu : 1 mètre équivaut à 0.001 kilomètres
}

if let converted = measurement.converted(to: .feet) {
    print("1 mètre équivaut à \(converted.value) pieds") // Résultat attendu : 1 mètre équivaut à 3.28084 pieds
}
```

#### Conversion de vitesse

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("100 kilomètres/heure équivaut à \(converted.value) mètres/seconde") // Résultat attendu : 100 kilomètres/heure équivaut à 27.7778 mètres/seconde
}

if let converted = speed.converted(to: .milesPerHour) {
    print("100 kilomètres/heure équivaut à \(converted.value) miles/heure") // Résultat attendu : 100 kilomètres/heure équivaut à 62.1371 miles/heure
}
```

#### Utilisation des composants SwiftUI

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### Exemple de conversion de plusieurs unités

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) équivaut à \(converted.value) mètres")
    }
}
// Résultat attendu :
// 1 mètre équivaut à 1 mètre
// 1 kilomètre équivaut à 1000 mètres
// 1 pied équivaut à 0.3048 mètre
```

### Structures et énumérations

#### AUnitType

L'énumération `AUnitType` représente les types d'unités, tels que la longueur, la vitesse, la pression, etc. Elle comprend les propriétés suivantes :

- `symbol`: Le symbole du type d'unité.
- `shortName`: Le nom court du type d'unité.
- `longName`: Le nom long du type d'unité.
- `detailedIntroduction`: L'introduction détaillée du type d'unité.
- `systemImage`: L'icône SF Symbol du type d'unité.

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

L'énumération `AUnit` représente les unités spécifiques, telles que le mètre, le kilomètre, le mètre par seconde, le kilogramme, etc. Elle comprend les propriétés suivantes :

- `unitType`: Le type auquel l'unité appartient.
- `coefficient`: Le coefficient de conversion de l'unité.
- `constant`: La constante de conversion de l'unité (utilisée pour les conversions de température).
- `symbol`: Le symbole de l'unité.
- `shortName`: Le nom court de l'unité.
- `longName`: Le nom long de l'unité.
- `detailedIntroduction`: L'introduction détaillée de l'unité.

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Autres unités omises...
}
```

#### AMeasurement

La structure `AMeasurement` représente une mesure avec une valeur et une unité spécifiques. Elle comprend les propriétés et méthodes suivantes :

- `value`: La valeur de la mesure.
- `unit`: L'unité de la mesure.
- `init(value:unit:)`: Initialise une nouvelle mesure.
- `converted(to:)`: Convertit la mesure en une autre unité.
- `adding(_:)`: Ajoute une autre mesure à cette mesure.
- `subtracting(_:)`: Soustrait une autre mesure de cette mesure.
- `multiplying(by:)`: Multiplie cette mesure par une autre mesure.
- `dividing(by:)`: Divise cette mesure par une autre mesure.

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // Autres méthodes omises...
}
```

### Exemples d'addition, soustraction, multiplication et division

#### Addition

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2 mètres + 3 mètres = \(result.value) mètres") // Résultat attendu : 2 mètres + 3 mètres = 5 mètres
}
```

#### Soustraction

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5 mètres - 3 mètres = \(result.value) mètres") // Résultat attendu : 5 mètres - 3 mètres = 2 mètres
}
```

#### Multiplication

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5 mètres * 2 = \(result.value) mètres") // Résultat attendu : 5 mètres * 2 = 10 mètres
```

#### Division

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10 mètres / 2 = \(result.value) mètres") // Résultat attendu : 10 mètres / 2 = 5 mètres
```

#### Exemple complexe : multiplier une vitesse par un temps pour obtenir une distance

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit

: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60 mètres/seconde * 120 secondes = \(distance.value) mètres") // Résultat attendu : 60 mètres/seconde * 120 secondes = 7200 mètres
}
```

#### Exemple complexe : diviser une distance par un temps pour obtenir une vitesse

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200 mètres / 120 secondes = \(speed.value) mètres/seconde") // Résultat attendu : 7200 mètres / 120 secondes = 60 mètres/seconde
}
```

## Deutsch

### Funktionen

- Unterstützt verschiedene Einheitentypen, einschließlich Länge, Geschwindigkeit, Druck, Temperatur, Masse, Volumen, Leistung usw.
- Bietet Funktionen zur Umrechnung zwischen Einheiten.
- Unterstützt SwiftUI-Komponenten zur Auswahl und Anzeige von Einheiten.

### Installation

Fügen Sie die Abhängigkeit in der Datei `Package.swift` hinzu:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### Anwendungsbeispiele

#### Grundlegende Umrechnung

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100 Grad Celsius entsprechen \(converted.value) Grad Fahrenheit") // Erwartetes Ergebnis: 100 Grad Celsius entsprechen 212 Grad Fahrenheit
}
```

#### Längenumrechnung

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1 Meter entspricht \(converted.value) Kilometern") // Erwartetes Ergebnis: 1 Meter entspricht 0.001 Kilometern
}

if let converted = measurement.converted(to: .feet) {
    print("1 Meter entspricht \(converted.value) Fuß") // Erwartetes Ergebnis: 1 Meter entspricht 3.28084 Fuß
}
```

#### Geschwindigkeitsumrechnung

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("100 Kilometer pro Stunde entsprechen \(converted.value) Meter pro Sekunde") // Erwartetes Ergebnis: 100 Kilometer pro Stunde entsprechen 27.7778 Meter pro Sekunde
}

if let converted = speed.converted(to: .milesPerHour) {
    print("100 Kilometer pro Stunde entsprechen \(converted.value) Meilen pro Stunde") // Erwartetes Ergebnis: 100 Kilometer pro Stunde entsprechen 62.1371 Meilen pro Stunde
}
```

#### Verwendung der SwiftUI-Komponenten

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### Beispiel für die Umrechnung mehrerer Einheiten

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) entspricht \(converted.value) Metern")
    }
}
// Erwartetes Ergebnis:
// 1 Meter entspricht 1 Meter
// 1 Kilometer entspricht 1000 Meter
// 1 Fuß entspricht 0.3048 Meter
```

### Strukturen und Enumerationen

#### AUnitType

Die Enumeration `AUnitType` repräsentiert die Arten von Einheiten, wie Länge, Geschwindigkeit, Druck usw. Sie enthält die folgenden Eigenschaften:

- `symbol`: Das Symbol für den Einheitstyp.
- `shortName`: Der Kurzname des Einheitstyps.
- `longName`: Der vollständige Name des Einheitstyps.
- `detailedIntroduction`: Die detaillierte Einführung des Einheitstyps.
- `systemImage`: Das SF-Symbol des Einheitstyps.

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

Die Enumeration `AUnit` repräsentiert die spezifischen Einheiten wie Meter, Kilometer, Meter pro Sekunde, Kilogramm usw. Sie enthält die folgenden Eigenschaften:

- `unitType`: Der Typ, zu dem die Einheit gehört.
- `coefficient`: Der Umrechnungskoeffizient der Einheit.
- `constant`: Die Umrechnungs-Konstante der Einheit (wird für Temperaturumrechnungen verwendet).
- `symbol`: Das Symbol der Einheit.
- `shortName`: Der Kurzname der Einheit.
- `longName`: Der vollständige Name der Einheit.
- `detailedIntroduction`: Die detaillierte Einführung der Einheit.

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Weitere Einheiten weggelassen...
}
```

#### AMeasurement

Die Struktur `AMeasurement` repräsentiert eine Messung mit einem bestimmten Wert und einer bestimmten Einheit. Sie enthält die folgenden Eigenschaften und Methoden:

- `value`: Der Wert der Messung.
- `unit`: Die Einheit der Messung.
- `init(value:unit:)`: Initialisiert eine neue Messung.
- `converted(to:)`: Wandelt die Messung in eine andere Einheit um.
- `adding(_:)`: Fügt eine andere Messung zu dieser Messung hinzu.
- `subtracting(_:)`: Subtrahiert eine andere Messung von dieser Messung.
- `multiplying(by:)`: Multipliziert diese Messung mit einer anderen Messung.
- `dividing(by:)`: Teilt diese Messung durch eine andere Messung.

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // Weitere Methoden weggelassen...
}
```

### Beispiele für Addition, Subtraktion, Multiplikation und Division

#### Addition

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2 Meter + 3 Meter = \(result.value) Meter") // Erwartetes Ergebnis: 2 Meter + 3 Meter = 5 Meter
}
```

#### Subtraktion

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5 Meter - 3 Meter = \(result.value) Meter") // Erwartetes Ergebnis: 5 Meter - 3 Meter = 2 Meter
}
```

#### Multiplikation

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5 Meter * 2 = \(result.value) Meter") // Erwartetes Ergebnis: 5 Meter * 2 = 10 Meter
```

#### Division

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10 Meter / 2 = \(result.value) Meter") // Erwartetes Ergebnis: 10 Meter / 2 = 5 Meter
```

#### Komplexes Beispiel: Geschwindigkeit mal Zeit ergibt Entfernung

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60 Meter/Sekunde * 120 Sekunden = \(distance.value) Meter") // Erwartetes Ergebnis: 60 Meter/Sekunde * 120 Sekunden = 7200 Meter
}
```

#### Komplexes Beispiel: Entfernung geteilt durch Zeit ergibt Geschwindigkeit

```swift
import AUnit

let distance

 = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200 Meter / 120 Sekunden = \(speed.value) Meter/Sekunde") // Erwartetes Ergebnis: 7200 Meter / 120 Sekunden = 60 Meter/Sekunde
}
```

## 한국어

### 기능

- 길이, 속도, 압력, 온도, 질량, 부피, 전력 등의 다양한 단위 유형을 지원합니다.
- 단위 간 변환 기능을 제공합니다.
- 단위를 선택하고 표시하기 위한 SwiftUI 컴포넌트를 지원합니다.

### 설치

`Package.swift` 파일에 종속성을 추가하십시오:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### 사용 예시

#### 기본 변환

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100도 섭씨는 화씨 \(converted.value)도와 같습니다") // 예상 결과: 100도 섭씨는 화씨 212도와 같습니다
}
```

#### 길이 변환

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1미터는 \(converted.value)킬로미터와 같습니다") // 예상 결과: 1미터는 0.001킬로미터와 같습니다
}

if let converted = measurement.converted(to: .feet) {
    print("1미터는 \(converted.value)피트와 같습니다") // 예상 결과: 1미터는 3.28084피트와 같습니다
}
```

#### 속도 변환

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("시속 100킬로미터는 초속 \(converted.value)미터와 같습니다") // 예상 결과: 시속 100킬로미터는 초속 27.7778미터와 같습니다
}

if let converted = speed.converted(to: .milesPerHour) {
    print("시속 100킬로미터는 시속 \(converted.value)마일과 같습니다") // 예상 결과: 시속 100킬로미터는 시속 62.1371마일과 같습니다
}
```

#### SwiftUI 컴포넌트 사용

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### 여러 단위 변환 예시

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName)는 \(converted.value)미터와 같습니다")
    }
}
// 예상 결과:
// 1 미터는 1 미터와 같습니다
// 1 킬로미터는 1000 미터와 같습니다
// 1 피트는 0.3048 미터와 같습니다
```

### 구조체와 열거형

#### AUnitType

`AUnitType` 열거형은 길이, 속도, 압력 등의 단위 유형을 나타냅니다. 다음 속성을 포함합니다:

- `symbol`: 단위 유형의 기호.
- `shortName`: 단위 유형의 짧은 이름.
- `longName`: 단위 유형의 전체 이름.
- `detailedIntroduction`: 단위 유형의 자세한 소개.
- `systemImage`: 단위 유형의 SF 심볼 아이콘.

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

`AUnit` 열거형은 미터, 킬로미터, 초당 미터, 킬로그램 등의 특정 단위를 나타냅니다. 다음 속성을 포함합니다:

- `unitType`: 단위가 속한 유형.
- `coefficient`: 단위 변환 계수.
- `constant`: 단위 변환 상수(온도 변환에 사용됨).
- `symbol`: 단위의 기호.
- `shortName`: 단위의 짧은 이름.
- `longName`: 단위의 전체 이름.
- `detailedIntroduction`: 단위의 자세한 소개.

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // 기타 단위 생략...
}
```

#### AMeasurement

`AMeasurement` 구조체는 특정 값과 단위를 가진 측정을 나타냅니다. 다음 속성과 메서드를 포함합니다:

- `value`: 측정 값.
- `unit`: 측정 단위.
- `init(value:unit:)`: 새로운 측정을 초기화합니다.
- `converted(to:)`: 측정을 다른 단위로 변환합니다.
- `adding(_:)`: 다른 측정을 이 측정에 추가합니다.
- `subtracting(_:)`: 다른 측정을 이 측정에서 빼줍니다.
- `multiplying(by:)`: 이 측정을 다른 측정으로 곱합니다.
- `dividing(by:)`: 이 측정을 다른 측정으로 나눕니다.

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // 기타 메서드 생략...
}
```

### 덧셈, 뺄셈, 곱셈, 나눗셈 예시

#### 덧셈

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2미터 + 3미터 = \(result.value)미터") // 예상 결과: 2미터 + 3미터 = 5미터
}
```

#### 뺄셈

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5미터 - 3미터 = \(result.value)미터") // 예상 결과: 5미터 - 3미터 = 2미터
}
```

#### 곱셈

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5미터 * 2 = \(result.value)미터") // 예상 결과: 5미터 * 2 = 10미터
```

#### 나눗셈

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10미터 / 2 = \(result.value)미터") // 예상 결과: 10미터 / 2 = 5미터
```

#### 복잡한 예시: 속도에 시간을 곱하여 거리 구하기

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("초당 60미터 * 120초 = \(distance.value)미터") // 예상 결과: 초당 60미터 * 120초 = 7200미터
}
```

#### 복잡한 예시: 거리를 시간으로 나누어

속도 구하기

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200미터 / 120초 = \(speed.value)미터/초") // 예상 결과: 7200미터 / 120초 = 60미터/초
}
```

## Español

### Funcionalidades

- Admite varios tipos de unidades, incluidas longitud, velocidad, presión, temperatura, masa, volumen, potencia, etc.
- Proporciona funciones para la conversión entre unidades.
- Admite componentes SwiftUI para seleccionar y mostrar unidades.

### Instalación

Agregue la dependencia en el archivo `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### Ejemplos de uso

#### Conversión básica

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .celsius)
if let converted = measurement.converted(to: .fahrenheit) {
    print("100 grados Celsius equivalen a \(converted.value) grados Fahrenheit") // Resultado esperado: 100 grados Celsius equivalen a 212 grados Fahrenheit
}
```

#### Conversión de longitud

```swift
import AUnit

let measurement = AMeasurement(value: 1, unit: .meters)
if let converted = measurement.converted(to: .kilometers) {
    print("1 metro equivale a \(converted.value) kilómetros") // Resultado esperado: 1 metro equivale a 0.001 kilómetros
}

if let converted = measurement.converted(to: .feet) {
    print("1 metro equivale a \(converted.value) pies") // Resultado esperado: 1 metro equivale a 3.28084 pies
}
```

#### Conversión de velocidad

```swift
import AUnit

let speed = AMeasurement(value: 100, unit: .kilometersPerHour)
if let converted = speed.converted(to: .metersPerSecond) {
    print("100 kilómetros por hora equivalen a \(converted.value) metros por segundo") // Resultado esperado: 100 kilómetros por hora equivalen a 27.7778 metros por segundo
}

if let converted = speed.converted(to: .milesPerHour) {
    print("100 kilómetros por hora equivalen a \(converted.value) millas por hora") // Resultado esperado: 100 kilómetros por hora equivalen a 62.1371 millas por hora
}
```

#### Uso de componentes SwiftUI

```swift
import SwiftUI
import AUnit

struct ContentView: View {
    @State private var selectedUnit: AUnit? = .meters

    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $selectedUnit)
            .padding()
    }
}
```

#### Ejemplo de conversión de varias unidades

```swift
import AUnit

let lengths: [AMeasurement] = [
    AMeasurement(value: 1, unit: .meters),
    AMeasurement(value: 1, unit: .kilometers),
    AMeasurement(value: 1, unit: .feet)
]

for length in lengths {
    if let converted = length.converted(to: .meters) {
        print("\(length.value) \(length.unit.shortName) equivale a \(converted.value) metros")
    }
}
// Resultado esperado:
// 1 metro equivale a 1 metro
// 1 kilómetro equivale a 1000 metros
// 1 pie equivale a 0.3048 metros
```

### Estructuras y enumeraciones

#### AUnitType

La enumeración `AUnitType` representa los tipos de unidades, como longitud, velocidad, presión, etc. Incluye las siguientes propiedades:

- `symbol`: El símbolo del tipo de unidad.
- `shortName`: El nombre corto del tipo de unidad.
- `longName`: El nombre completo del tipo de unidad.
- `detailedIntroduction`: La introducción detallada del tipo de unidad.
- `systemImage`: El ícono SF Symbol del tipo de unidad.

```swift
public enum AUnitType: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data
}
```

#### AUnit

La enumeración `AUnit` representa unidades específicas, como el metro, el kilómetro, el metro por segundo, el kilogramo, etc. Incluye las siguientes propiedades:

- `unitType`: El tipo al que pertenece la unidad.
- `coefficient`: El coeficiente de conversión de la unidad.
- `constant`: La constante de conversión de la unidad (utilizada para las conversiones de temperatura).
- `symbol`: El símbolo de la unidad.
- `shortName`: El nombre corto de la unidad.
- `longName`: El nombre completo de la unidad.
- `detailedIntroduction`: La introducción detallada de la unidad.

```swift
public enum AUnit: String, Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Otras unidades omitidas...
}
```

#### AMeasurement

La estructura `AMeasurement` representa una medida con un valor y una unidad específicos. Incluye las siguientes propiedades y métodos:

- `value`: El valor de la medida.
- `unit`: La unidad de la medida.
- `init(value:unit:)`: Inicializa una nueva medida.
- `converted(to:)`: Convierte la medida a otra unidad.
- `adding(_:)`: Agrega otra medida a esta medida.
- `subtracting(_:)`: Resta otra medida de esta medida.
- `multiplying(by:)`: Multiplica esta medida por otra medida.
- `dividing(by:)`: Divide esta medida por otra medida.

```swift
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    public var value: Double
    public var unit: AUnit

    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    // Otros métodos omitidos...
}
```

### Ejemplos de suma, resta, multiplicación y división

#### Suma

```swift
import AUnit

let length1 = AMeasurement(value: 2, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.adding(length2) {
    print("2 metros + 3 metros = \(result.value) metros") // Resultado esperado: 2 metros + 3 metros = 5 metros
}
```

#### Resta

```swift
import AUnit

let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 3, unit: .meters)
if let result = length1.subtracting(length2) {
    print("5 metros - 3 metros = \(result.value) metros") // Resultado esperado: 5 metros - 3 metros = 2 metros
}
```

#### Multiplicación

```swift
import AUnit

let length = AMeasurement(value: 5, unit: .meters)
let scalar = 2.0
let result = length.multiplying(by: scalar)
print("5 metros * 2 = \(result.value) metros") // Resultado esperado: 5 metros * 2 = 10 metros
```

#### División

```swift
import AUnit

let length = AMeasurement(value: 10, unit: .meters)
let scalar = 2.0
let result = length.dividing(by: scalar)
print("10 metros / 2 = \(result.value) metros") // Resultado esperado: 10 metros / 2 = 5 metros
```

#### Ejemplo complejo: multiplicar velocidad por tiempo para obtener distancia

```swift
import AUnit

let speed = AMeasurement(value: 60, unit: .metersPerSecond)
let time = AMeasurement(value: 120, unit: .seconds)
if let distance = speed.multiplying(by: time) {
    print("60 metros/segundo * 120 segundos = \(distance.value) metros") // Resultado esperado: 60 metros/segundo * 120 segundos = 7200 metros
}
```

#### Ejemplo complejo: dividir distancia por tiempo para obtener velocidad

```swift
import AUnit

let distance = AMeasurement(value: 7200, unit: .meters)
let time = AMeasurement(value: 120, unit: .seconds)
if let speed = distance.dividing(by: time) {
    print("7200 metros / 120 segundos = \(speed.value) metros/segundo") // Resultado esperado: 7200 metros / 120 segundos = 60 metros/segundo
}
```
