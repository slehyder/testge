//
//  RoutingApp.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI

struct RoutingApp: Hashable {
    
    static func == (lhs: RoutingApp, rhs: RoutingApp) -> Bool {
        return lhs.route == rhs.route 
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(route)
    }
    
    let route: AppRoute
    
    var post: Post? = nil
}
