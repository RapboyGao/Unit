import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct AUnitTranslationPreviewView: View {
    // 获取所有可用的本地化列表，过滤掉 Base 本地化
    let localizations: [String] = Bundle.module.localizations.filter { $0 != "Base" }

    var body: some View {
        List(AUnitType.allCases) { unitType in
            Section(header: Text(unitType.longName)) {
                AUnitForeachView(typeFilter: unitType) { unit in
                    VStack(alignment: .leading) {
                        Text("Symbol: \(unit.symbol)")
                        Text("Short Name: \(unit.shortName)")
                        Text("Long Name: \(unit.longName)")
                    }
                }
            }
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    ForEach(Bundle.module.localizations.filter { $0 != "Base" }, id: \.self) { localization in
        AUnitTranslationPreviewView()
            .environment(\.locale, .init(identifier: localization))
            .previewDisplayName(localization)
    }
}
