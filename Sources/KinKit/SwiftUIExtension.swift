//
//  SwiftUIExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//


import SwiftUI

public extension View {
    @ViewBuilder
    func scrollable() -> some View {
        ScrollView {
            self
        }
    }
    var toAnyView: AnyView {
        AnyView(self)
    }
}
