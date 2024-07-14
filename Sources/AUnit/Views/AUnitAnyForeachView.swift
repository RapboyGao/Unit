//
//  SwiftUIView.swift
//
//
//  Created by 高效奕 on 2024/7/14.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct AUnitAnyForeachView<Label: View, Content: View>: View {
    private var label: (AUnitType) -> Label
    private var content: (AUnit) -> Content

    public var body: some View {
        ForEach(AUnitType.allCases) { typeFilter in
            Menu {
                AUnitForeachView(typeFilter: typeFilter) {
                    content($0)
                }
            } label: {
                label(typeFilter)
            }
        }
    }

    public init(@ViewBuilder label: @escaping (AUnitType) -> Label, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.label = label
        self.content = content
    }
}
