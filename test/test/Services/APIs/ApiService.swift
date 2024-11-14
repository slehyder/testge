//
//  ApiService.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import Dependiject
import UIKit

protocol ApiService: AnyObservableObject {
    func getPosts() async throws -> [Post]?
    func getTodos() async throws -> [Todo]?
    func getCommentsPost(id: Int) async throws -> [Comment]?
}

class ApiServiceImpl: ApiService, ObservableObject {
    
    func getPosts() async throws -> [Post]? {
        return try await ServiceRequest.makeRequest(path: "/posts", method: .get)
    }
    
    func getTodos() async throws -> [Todo]? {
        return try await ServiceRequest.makeRequest(path: "/todos", method: .get)
    }
    
    func getCommentsPost(id: Int) async throws -> [Comment]? {
        return try await ServiceRequest.makeRequest(path: "/posts/\(id)/comments", method: .get)
    }
}

