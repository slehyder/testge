//
//  MainView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import SwiftUI
import Dependiject

struct MainView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @Store var appNavController = Factory.shared.resolve(AppNavigationController.self)
    @Store var appWrapperController = Factory.shared.resolve(AppWrapperController.self)
    
    @State private var showingLoading: Bool = false
    
    var body: some View {
            NavigationStack(path: $appNavController.appNavigationPath) {
                SplashView()
                    .navigationDestination(for: RoutingApp.self) { value in
                        switch (value.route) {
                        case .CommentsPost:
                            CommentsView(post: value.post!)
                                .navigationBarBackButtonHidden(true)
                        case .Main:
                            MainTabbarView()
                                .navigationBarBackButtonHidden(true)
                        }
                    }
            .navigationViewStyle(.stack)
        }
    }
}

#Preview {
    MainView()
}

