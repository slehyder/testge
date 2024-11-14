//
//  MainViewModel.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

protocol MainTabbarViewModel: AnyObservableObject {

    var posts: [Post] { get set }
    var todos: [Todo] {get set}
    var isLoading: Bool {get set}
    
    func getPosts()
    func getTodos()
    func navigateToComments(post: Post)
}

final class MainTabbarViewModelImpl: MainTabbarViewModel, ObservableObject {

    @Published var posts: [Post] = []
    @Published var todos: [Todo] = []
    @Published var isLoading: Bool = false
 
    private let appRepository: AppRepository
    private var appNavController: AppNavigationController
    private var appWrapperController: AppWrapperController
    
    init(appRepository: AppRepository,
         appNavController: AppNavigationController,
         appWrapperController: AppWrapperController) {
        self.appRepository = appRepository
        self.appNavController = appNavController
        self.appWrapperController = appWrapperController
    }
    
    func getPosts() {
        isLoading = true
        Task {
            let response = await appRepository.getPosts()
            isLoading = false
            if response.isSuccess {
                posts = response.data ?? []
            }
        }
    }
    
    func getTodos() {
        isLoading = true
        Task {
            let response = await appRepository.getTodos()
            isLoading = false
            if response.isSuccess {
                todos = response.data ?? []
            }
        }
    }
    
    func navigateToComments(post: Post) {
        appNavController.navigateToComments(post: post)
    }
}


