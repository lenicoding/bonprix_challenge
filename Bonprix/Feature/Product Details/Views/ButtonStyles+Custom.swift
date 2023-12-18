//
//  ButtonStyles+Custom.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 18.12.23.
//

import SwiftUI

struct BorderedTransparent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(.tint)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
                .stroke(.tint, lineWidth: 1)
            )
    }
}

struct BorderedSolid: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(Color.white)
            .backgroundStyle(Color.black)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
            )
    }
}

extension ButtonStyle where Self == BorderedTransparent {
    static var borderedTransparent: Self {
        return .init()
    }
}

extension ButtonStyle where Self == BorderedSolid {
    static var borderedSolid: Self {
        return .init()
    }
}
