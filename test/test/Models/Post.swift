//
//  Post.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation

struct Post: Codable {
    var id: Int
    var title: String?
    var body: String?
    var userId: Int?
}
