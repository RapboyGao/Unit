# AUnit

## 한국어

### 소개

`AUnit` 패키지는 측정 단위를 다루기 위한 종합적인 시스템을 제공합니다. 다양한 단위 타입의 지원, 단위 간 변환 및 측정 계산을 포함합니다. 이 패키지는 애플리케이션에서 다양한 측정 단위를 처리해야 하는 개발자에게 이상적입니다.

### 설치

`AUnit` 패키지를 설치하려면 `Package.swift`에 다음을 추가하세요:

```swift
dependencies: [
    .package(url: "https://github.com/your-repository/AUnit.git", .branch("main"))
]
```

### 사용 방법

#### 패키지 임포트

먼저, Swift 파일에 패키지를 임포트합니다:

```swift
import AUnit
```

#### 단위 정의

`AUnitType`과 `AUnit` 열거형을 사용하여 다양한 타입의 단위를 정의할 수 있습니다. 예를 들어:

```swift
let lengthUnit: AUnit = .meters
let temperatureUnit: AUnit = .celsius
```

#### 측정값 생성

특정 값과 단위를 사용하여 측정값을 생성합니다:

```swift
let distance = AMeasurement(value: 100, unit: .meters)  // 100 미터
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
```

#### 단위 변환

측정값을 다른 단위로 변환합니다:

```swift
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print("거리: \(distanceInKilometers.value) \(distanceInKilometers.unit.symbol)")  // 거리: 0.1 킬로미터
}
```

#### 측정값 더하기

먼저, 두 개의 측정값을 정의합니다:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 미터
let measurement2 = AMeasurement(value: 500, unit: .meters)  // 500 미터
```

다음으로, 이 두 측정값을 더합니다:

```swift
if let totalDistance = measurement1.adding(measurement2) {
    print("총 거리: \(totalDistance.value) \(totalDistance.unit.symbol)")  // 총 거리: 600 미터
}
```

온도 차이를 온도에 더합니다:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)  // 10°C 차이
if let newTemperature = temperature.adding(tempDifference) {
    print("새 온도: \(newTemperature.value) \(newTemperature.unit.symbol)")  // 새 온도: 35°C
}
```

#### 측정값 빼기

먼저, 두 개의 측정값을 정의합니다:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 미터
let measurement2 = AMeasurement(value: 50, unit: .meters)  // 50 미터
```

다음으로, 하나의 측정값에서 다른 측정값을 뺍니다:

```swift
if let remainingDistance = measurement1.subtracting(measurement2) {
    print("남은 거리: \(remainingDistance.value) \(remainingDistance.unit.symbol)")  // 남은 거리: 50 미터
}
```

온도에서 온도 차이를 뺍니다:

```swift
let temperature = AMeasurement(value: 25, unit: .celsius)  // 25°C
let tempDifference = AMeasurement(value: 5, unit: .celsiusDelta)  // 5°C 차이
if let coolerTemperature = temperature.subtracting(tempDifference) {
    print("더 낮은 온도: \(coolerTemperature.value) \(coolerTemperature.unit.symbol)")  // 더 낮은 온도: 20°C
}
```

#### 측정값 곱하기

먼저, 두 개의 측정값을 정의합니다:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 미터
let measurement2 = AMeasurement(value: 2, unit: .meters)  // 2 미터
```

다음으로, 이 두 측정값을 곱합니다:

```swift
if let area = measurement1.multiplying(by: measurement2) {
    print("면적: \(area.value) \(area.unit.symbol)")  // 면적: 200 제곱미터
}
```

전력을 시간으로 곱합니다:

```swift
let power = AMeasurement(value: 100, unit: .watts)  // 100 와트
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 시간
if let energy = power.multiplying(by: time) {
    print("에너지: \(energy.value) \(energy.unit.symbol)")  // 에너지: 360000 줄
}
```

#### 측정값 나누기

먼저, 두 개의 측정값을 정의합니다:

```swift
let measurement1 = AMeasurement(value: 100, unit: .meters)  // 100 미터
let measurement2 = AMeasurement(value: 10, unit: .seconds)  // 10 초
```

다음으로, 하나의 측정값을 다른 측정값으로 나눕니다:

```swift
if let speed = measurement1.dividing(by: measurement2) {
    print("속도: \(speed.value) \(speed.unit.symbol)")  // 속도: 10 미터/초
}
```

에너지를 시간으로 나누어 전력을 얻습니다:

```swift
let energy = AMeasurement(value: 360000, unit: .joules)  // 360000 줄
let time = AMeasurement(value: 3600, unit: .seconds)  // 1 시간
if let powerFromEnergy = energy.dividing(by: time) {
    print("전력: \(powerFromEnergy.value) \(powerFromEnergy.unit.symbol)")  // 전력: 100 와트
}
```

### 단위 미리보기 (SwiftUI)

SwiftUI를 사용하는 경우, 단위 목록을 미리볼 수 있습니다:

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
