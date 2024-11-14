//
//  Comment.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String?
    var email: String?
    var body: String?
}
