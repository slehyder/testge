//
//  testApp.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import SwiftUI
import Dependiject

@main
struct testApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.colorScheme, .light)
        }
    }
    
    init() {
        Factory.register {
            //Singletones
            Service(.singleton, AppNavigationController.self) { _ in
                AppNavigationControllerImpl()
            }
            Service(.singleton, AppWrapperController.self) { _ in
                AppWrapperControllerImpl()
            }
            Service(.singleton, ApiService.self) { _ in
                ApiServiceImpl()
            }
            
            //Repositories
            Service(.singleton, AppRepository.self) { r in
                AppRepositoryImpl(apiService: r.resolve())
            }
            
            Service(.weak, MainTabbarViewModel.self) { r in
                MainTabbarViewModelImpl(appRepository: r.resolve(),
                                 appNavController: r.resolve(),
                                 appWrapperController: r.resolve())
            }
            
            Service(.weak, SplashViewModel.self) { r in
                SplashViewModelImp(appRepository: r.resolve(),
                                 appNavController: r.resolve(),
                                 appWrapperController: r.resolve())
            }
            
            
            Service(.weak, CommentsViewModel.self) { r in
                CommentsViewModelImpl(appRepository: r.resolve(),
                                 appNavController: r.resolve(),
                                 appWrapperController: r.resolve())
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        #if DEBUG
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
        #else
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
        #endif
        
        return true
    }
}
