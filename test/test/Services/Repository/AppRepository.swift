//
//  AppRepository.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import UIKit
import SwiftUI

protocol AppRepository {
    func getPosts() async -> NetworkResource<[Post]>
    func getTodos() async -> NetworkResource<[Todo]>
    func getCommentsPost(id: Int) async -> NetworkResource<[Comment]>
}

class AppRepositoryImpl: AppRepository {

    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getPosts() async -> NetworkResource<[Post]> {
        do {
            let responseData = try await apiService.getPosts()
            return NetworkResource.init(successData: responseData ?? [])
        } catch {
            return NetworkResource.init(error: MainErrorResponse.cathError(error: error))
        }
    }
    
    func getTodos() async -> NetworkResource<[Todo]> {
        do {
            let responseData = try await apiService.getTodos()
            return NetworkResource.init(successData: responseData ?? [])
        } catch {
            return NetworkResource.init(error: MainErrorResponse.cathError(error: error))
        }
    }
    
    func getCommentsPost(id: Int) async -> NetworkResource<[Comment]> {
        do {
            let responseData = try await apiService.getCommentsPost(id: id)
            return NetworkResource.init(successData: responseData ?? [])
        } catch {
            return NetworkResource.init(error: MainErrorResponse.cathError(error: error))
        }
    }
}
