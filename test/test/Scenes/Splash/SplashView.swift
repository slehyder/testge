//
//  SplashView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import SwiftUI
import Dependiject

struct SplashView: View {
    
    @Store var viewModel = Factory.shared.resolve(SplashViewModel.self)
    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.getData()
        }
    }
}

#Preview {
    SplashView()
}
