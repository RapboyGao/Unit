# AUnit

## 日本語

### 概要

`AUnit` パッケージは、測定単位を操作するための包括的なシステムを提供します。さまざまな単位タイプのサポート、単位間の変換、および測定計算を含みます。このパッケージは、アプリケーションでさまざまな測定単位を処理する必要がある開発者に最適です。

### インストール

`AUnit` パッケージをインストールするには、`Package.swift` に以下を追加します：

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### 使用方法

#### パッケージのインポート

まず、Swift ファイルにパッケージをインポートします：

```swift
import AUnit
```

#### 単位の定義

`AUnitType` と `AUnit` 列挙型を使用して、さまざまなタイプの単位を定義できます。例えば：

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### 測定値の作成

特定の値と単位を使用して測定値を作成します：

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 メートル
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### 単位変換

測定値を別の単位に変換します：

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("距離: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // 距離: 0.1 キロメートル
}
```

#### 測定値の加算

まず、2 つの測定値を定義します：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 メートル
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 メートル
```

次に、これら 2 つの測定値を加算します：

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("合計距離: \(totalDistance.value) \(totalDistance.unit.symbol)")  // 合計距離: 600 メートル
}
```

温度差を温度に加算します：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // 10°C の差
if let newTemperature = temperature.adding(tempDifference) {
    print("新しい温度: \(newTemperature.value) \(newTemperature.unit.symbol)")  // 新しい温度: 35°C
}
```

#### 測定値の減算

まず、2 つの測定値を定義します：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 メートル
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 メートル
```

次に、1 つの測定値から別の測定値を減算します：

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("残りの距離: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // 残りの距離: 50 メートル
}
```

温度から温度差を減算します：

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // 5°C の差
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("低い温度: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // 低い温度: 20°C
}
```

#### 測定値の乗算

まず、2 つの測定値を定義します：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 メートル
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 メートル
```

次に、これら 2 つの測定値を乗算します：

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("面積: \(area.value) \(area.unit.symbol)")  // 面積: 200 平方メートル
}
```

パワーを時間で乗算します：

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 ワット
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 時間
if let energy = power.multiplying(by: time) {
    print("エネルギー: \(energy.value) \(energy.unit.symbol)")  // エネルギー: 360000 ジュール
}
```

#### 測定値の除算

まず、2 つの測定値を定義します：

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 メートル
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 秒
```

次に、1 つの測定値を別の測定値で除算します：

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("速度: \(speed.value) \(speed.unit.symbol)")  // 速度: 10 メートル/秒
}
```

エネルギーを時間で除算してパワーを得ます：

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 ジュール
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 時間
if let powerFromEnergy = energy.dividing(by: time) {
    print("パワー: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // パワー: 100 ワット
}
```

### 単位のプレビュー（SwiftUI）

SwiftUI を使用している場合、単位リストをプレビューできます：

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
