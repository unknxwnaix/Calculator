//
//  ViewModel.swift
//  Calculator
//
//  Created by Maxim Dmitrochenko on 08-09-2024.
//

import SwiftUI

class ViewModel: ObservableObject {
     
    // MARK: Property
    @Published var value = "0"
    @Published var number: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    // MARK: Tap button Method
    func didTap (item: Buttons) {
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ??  0
            value = ""
        case .equal:
            if let currentValue = Double(value) {
                 value = formatResult(performOperation(currentValue))
            }
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                 value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                 value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    // MARK: Calculating Method
    func performOperation (_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addiction:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    // MARK: Remove last zero Method
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    // MARK: Size of Buttons Methods
    func findButtonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 14
        var totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            totalSpacing = 4 * spacing
            return ((screenWidth - totalSpacing) / totalColumns * 2) + 6
        }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func findButtonHeight(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 14
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }
}
