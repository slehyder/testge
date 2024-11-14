//
//  Todo.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation

struct Todo: Codable {
    var userId: Int
    var id: Int?
    var title: String?
    var completed: Bool?
}
