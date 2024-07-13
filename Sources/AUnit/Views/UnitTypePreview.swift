//
//  SwiftUIView.swift
//
//
//  Created by 高效奕 on 2024/7/13.
//
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct UnitTypesView: View {
    var body: some View {
        List(AUnitType.allCases, id: \.self) { unitType in
            Menu(unitType.shortName) {
                UnitViews(filtererType: unitType)
            }
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    Group {
        UnitTypesView()
    }
    .environment(\.locale, .init(identifier: "zh-Hans"))
}
