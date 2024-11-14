//
//  CommentsViewModel.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

protocol CommentsViewModel: AnyObservableObject {

    var comments: [Comment] { get set }
    var post: Post? { get set }
    var isLoading: Bool {get set}
    
    func getComments(id: Int)
    func navigateToBack()
}

final class CommentsViewModelImpl: CommentsViewModel, ObservableObject {

    @Published var comments: [Comment] = []
    @Published var post: Post? = nil
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
    
    func getComments(id: Int) {
        isLoading = true
        Task {
            let response = await appRepository.getCommentsPost(id: id)
            isLoading = false
            if response.isSuccess {
                comments = response.data ?? []
            }
        }
    }
    
    func navigateToBack() {
        appNavController.navigateBack()
    }
}



