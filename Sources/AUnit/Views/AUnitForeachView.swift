import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A view for iterating over units of a specific type.
/// 提供遍历特定类型单位的视图。
public struct AUnitForeachView<Content: View>: View {
    private var typeFilter: AUnitType
    private var content: (AUnit) -> Content

    private var unitsOfTheSameType: [AUnit] {
        AUnit.allCases.filter { unit in
            unit.unitType == typeFilter
        }
    }

    public var body: some View {
        ForEach(unitsOfTheSameType) { unit in
            content(unit)
        }
    }

    /// Initializes a new instance of `AUnitForeachView`.
    /// 初始化 `AUnitForeachView` 的新实例。
    /// - Parameters:
    ///   - typeFilter: The unit type to filter by.
    ///     要过滤的单位类型。
    ///   - content: A view builder that provides the content for each unit.
    ///     为每个单位提供内容的视图构建器。
    public init(typeFilter: AUnitType, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.typeFilter = typeFilter
        self.content = content
    }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
#Preview {
    List {
        AUnitForeachView(typeFilter: .speed) { unit in
            DisclosureGroup(unit.longName) {
                Text(unit.detailedIntroduction)
            }
        }
    }
}
