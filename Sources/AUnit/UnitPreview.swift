//
//  SwiftUIView.swift
//
//
//  Created by 高效奕 on 2024/7/12.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private struct UnitViews: View {
    var body: some View {
        List {
            ForEach(AUnit.allCases, id: \.self) { unit in
                Text(verbatim: unit.symbol + " / " + unit.shortName + " / " + unit.longName)
            }
        }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
#Preview {
    Group {
        UnitViews()
    }
}
