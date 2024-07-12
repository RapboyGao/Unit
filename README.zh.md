# AUnit

### 简介

`AUnit` 包提供了一个全面的测量单位系统。它包括对各种单位类型的支持、单位之间的转换以及测量计算。这个包对于需要在应用程序中处理不同测量单位的开发人员来说是理想的选择。

### 安装

要安装 `AUnit` 包，请在 `Package.swift` 中添加以下内容：

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### 使用方法

#### 导入包

首先，将包导入到您的 Swift 文件中：

```swift
import AUnit
```

#### 定义单位

您可以使用 `AUnitType` 和 `AUnit` 枚举来定义不同类型的单位。例如：

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### 处理测量值

使用特定值和单位创建测量值：

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 米
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### 单位转换

将测量值转换为另一单位：

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("距离: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // 距离: 0.1 千米
}
```

#### 添加测量值

首先，定义两个测量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 米
```

然后，将两个测量值相加：

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("总距离: \(totalDistance.value) \(totalDistance.unit.symbol)")  // 总距离: 600 米
}
```

将温度差添加到温度中：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // 10°C 差异
if let newTemperature = temperature.adding(tempDifference) {
    print("新温度: \(newTemperature.value) \(newTemperature.unit.symbol)")  // 新温度: 35°C
}
```

#### 减去测量值

首先，定义两个测量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 米
```

然后，从一个测量值中减去另一个测量值：

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("剩余距离: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // 剩余距离: 50 米
}
```

从温度中减去温度差：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference =

 AMeasurement(value: 5, unit: .celsiusDelta)  // 5°C 差异
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("较低温度: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // 较低温度: 20°C
}
```

#### 乘以测量值

首先，定义两个测量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 米
```

然后，将两个测量值相乘：

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("面积: \(area.value) \(area.unit.symbol)")  // 面积: 200 平方米
}
```

将功率乘以时间：

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 瓦
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 小时
if let energy = power.multiplying(by: time) {
    print("能量: \(energy.value) \(energy.unit.symbol)")  // 能量: 360000 焦耳
}
```

#### 除以测量值

首先，定义两个测量值：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 米
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 秒
```

然后，将一个测量值除以另一个测量值：

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("速度: \(speed.value) \(speed.unit.symbol)")  // 速度: 10 米/秒
}
```

将能量除以时间以获得功率：

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 焦耳
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 小时
if let powerFromEnergy = energy.dividing(by: time) {
    print("功率: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // 功率: 100 瓦
}
```

### 单位预览（SwiftUI）

如果您使用的是 SwiftUI，可以预览单位列表：

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
