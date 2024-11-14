//
//  MainTabbarView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI

struct MainTabbarView: View {
    var body: some View {
        TabView {
            PostsView()
                .tabItem {
                    Label("Posts", systemImage: "list.bullet")
                }
            
            TodosView()
                .tabItem {
                    Label("To-Do", systemImage: "square.grid.2x2")
                }
        }
    }
}

#Preview {
    MainTabbarView()
}
