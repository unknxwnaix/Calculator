//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Maxim Dmitrochenko on 05-09-2024.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView ()
                .environmentObject(viewModel )
        }
    }
}
