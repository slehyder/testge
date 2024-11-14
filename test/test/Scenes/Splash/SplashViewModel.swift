//
//  SplashViewModel.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import SwiftUI
import Dependiject

protocol SplashViewModel: AnyObservableObject {
    func getData()
}

final class SplashViewModelImp: SplashViewModel, ObservableObject {
    
    private let appRepository: AppRepository
    private var appNavController: AppNavigationController
    private var appWrapperController: AppWrapperController
    
    init(appRepository: AppRepository,
         appNavController: AppNavigationController,
         appWrapperController: AppWrapperController
    ) {
        self.appRepository = appRepository
        self.appNavController = appNavController
        self.appWrapperController = appWrapperController
    }
    
    func getData() {
        Task {
            try await Task.sleep(nanoseconds: 1_200_000_000)
            navigateToMain()
        }
    }
    
    private func navigateToMain() {
        appNavController.navigate(route: AppRoute.Main)
    }
}


