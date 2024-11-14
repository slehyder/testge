//
//  PostsView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

struct PostsView: View {
    
    @Store var viewModel = Factory.shared.resolve(MainTabbarViewModel.self)
    
    var body: some View {
        NavigationView {
            List(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text(post.title ?? "")
                        .font(.headline)
                    Text("ID: \(post.id)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .onTapGesture {
                    viewModel.navigateToComments(post: post)
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.getPosts()
            }
            .overlay(
                viewModel.isLoading ? ProgressView("Loading...").scaleEffect(1.5) : nil
            )
        }
    }
}

#Preview {
    PostsView()
}
