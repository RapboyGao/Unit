//
//  SwiftUIView.swift
//
//
//  Created by 高效奕 on 2024/7/12.
//
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct UnitViews: View {
    var filtererType: AUnitType? = nil

    var filtered: [AUnit] {
        AUnit.allCases.filter { unit in
            guard let filtererType = filtererType
            else { return true }
            return unit.unitType == filtererType
        }
    }

    var body: some View {
        ForEach(filtered, id: \.self) { unit in
            Text(verbatim: unit.symbol + " / " + unit.shortName + " / " + unit.longName)
        }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
#Preview {
    List {
        UnitViews()
    }
}
