//
//  SwiftUIView.swift
//
//
//  Created by 高效奕 on 2024/7/13.
//
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct UnitTypesView: View {
    var body: some View {
        List(AUnitType.allCases, id: \.self) { unitType in

            Section(unitType.shortName) {
                UnitViews(filtererType: unitType)
            }
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    Group {
        UnitTypesView()
    }
    .environment(\.locale, .init(identifier: "zh-Hans"))
}
