//
//  Extension.swift
//  Calculator
//
//  Created by Maxim Dmitrochenko on 05-09-2024.
//

import SwiftUI
extension Color {
    //static let darkGrayCalc = Color("darkGrayCalc")
    //static let orangeCalc = Color("orangeCalc")
    //static let gray = Color("grayCalc")
}
extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case .plus:
            return .addiction
        case .minus:
            return .subtract
        case .multiple:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}
