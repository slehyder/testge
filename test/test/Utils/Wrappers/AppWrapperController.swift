//
//  AppWrapperController.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import Dependiject
import SwiftUI


protocol AppWrapperController: AnyObservableObject {
    
    var loadingState: Published<Bool>.Publisher { get }
}

class AppWrapperControllerImpl: AppWrapperController, ObservableObject {

    @Published var showRegisterModal = false
    @Published var showLoading = false
    var loadingState: Published<Bool>.Publisher { $showLoading }
}


