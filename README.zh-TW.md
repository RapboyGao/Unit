# AUnit

## 繁體中文

### 簡介

`AUnit` 包提供了一個全面的測量單位系統。它包括對各種單位類型的支持、單位之間的轉換以及測量計算。這個包對於需要在應用程式中處理不同測量單位的開發人員來說是理想的選擇。

### 安裝

要安裝 `AUnit` 包，請在 `Package.swift` 中添加以下內容：

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### 使用方法

#### 導入包

首先，將包導入到您的 Swift 文件中：

```swift
import AUnit
```

#### 定義單位

您可以使用 `AUnitType` 和 `AUnit` 枚舉來定義不同類型的單位。例如：

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### 處理測量值

使用特定值和單位創建測量值：

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 米
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### 單位轉換

將測量值轉換為另一單位：

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("距離: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // 距離: 0.1 千米
}
```

#### 添加測量值

首先，定義兩個測量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 米
```

然後，將兩個測量值相加：

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("總距離: \(totalDistance.value) \(totalDistance.unit.symbol)")  // 總距離: 600 米
}
```

將溫度差添加到溫度中：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // 10°C 差異
if let newTemperature = temperature.adding(tempDifference) {
    print("新溫度: \(newTemperature.value) \(newTemperature.unit.symbol)")  // 新溫度: 35°C
}
```

#### 減去測量值

首先，定義兩個測量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 米
```

然後，從一個測量值中減去另一個測量值：

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("剩餘距離: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // 剩餘距離: 50 米
}
```

從溫度中減去溫度差：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // 5°C 差異
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("較低溫度: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // 較低溫度: 20°C
}
```

#### 乘以測量值

首先，定義兩個測量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 米
```

然後，將兩個測量值相乘：

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("面積: \(area.value) \(area.unit.symbol)")  // 面積: 200 平方米
}
```

將功率乘以時間：

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 瓦
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 小時
if let energy = power.multiplying(by: time) {
    print("能量: \(energy.value) \(energy.unit.symbol)")  // 能量: 360000 焦耳
}
```

#### 除以測量值

首先，定義兩個測量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 秒
```

然後，將一個測量值除以另一個測量值：

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("速度: \(speed.value) \(speed.unit.symbol)")  // 速度: 10 米/秒
}
```

將能量除以時間以獲得功率：

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 焦耳
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 小時
if let powerFromEnergy = energy.dividing(by: time) {
    print("功率: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // 功率: 100 瓦
}
```

### 單位預覽（SwiftUI）

如果您使用的是 SwiftUI，可以預覽單位列表：

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
