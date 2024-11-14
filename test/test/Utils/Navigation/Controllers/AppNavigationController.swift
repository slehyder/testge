//
//  AppNavigationController.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

protocol AppNavigationController: AnyObservableObject {
    
    func navigate(route: AppRoute)
    var appNavigationPath: NavigationPath { get set }
    func navigateBack()
    func navigateToComments(post: Post)
}

class AppNavigationControllerImpl: AppNavigationController, ObservableObject {

    @Published var appNavigationPath = NavigationPath()
    
    func navigate(route: AppRoute) {
        appNavigationPath.append(RoutingApp(route: route))
    }
    
    func navigateBack() {
        appNavigationPath.removeLast()
    }
    
    func navigateToRoot() {
        appNavigationPath = NavigationPath()
    }
    
    func navigateBack(steps: Int) {
        appNavigationPath.removeLast(steps)
    }
    
    func navigateToComments(post: Post) {
        appNavigationPath.append(RoutingApp(route: .CommentsPost, post: post))
    }
}

