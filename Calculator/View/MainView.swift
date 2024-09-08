//
//  MainView.swift
//  Calculator
//
//  Created by Maxim Dmitrochenko on 05-09-2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color.black
                .ignoresSafeArea()
            
            VStack (spacing: 12) {
                Spacer()
                
                // MARK: Display
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 28)
                }
                
                // MARK: Buttons
                ForEach(viewModel.buttonsArray, id: \.self) { row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(item: item)
                            } label: {
                                let buttonWidth = viewModel.findButtonWidth(item: item)
                                let buttonHeight = viewModel.findButtonHeight(item: item)
                                Text(item.rawValue)
                                    .padding(.leading, item == .zero ? 30 : 0)
                                    .fontWeight(.light)
                                    .frame(
                                        width: buttonWidth,
                                        height: buttonHeight,
                                        alignment: item.buttonTextAlignment)
                                    .foregroundColor(item.buttonFontColor)
                                    .background(item.buttonColor)
                                    .font(.system(size: 38))
                                    .cornerRadius(buttonHeight/2)
                                
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
