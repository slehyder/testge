//
//  CommentsView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

struct CommentsView: View {
    
    @Store var viewModel = Factory.shared.resolve(CommentsViewModel.self)
    
    init(post: Post) {
        viewModel.post = post
    }
    
    var body: some View {
        VStack {
            List(viewModel.comments, id: \.id) { comment in
                 VStack(alignment: .leading, spacing: 8) {
                     Text(comment.name ?? "")
                         .font(.headline)
                     Text(comment.email ?? "")
                         .font(.subheadline)
                         .foregroundColor(.gray)
                     Text(comment.body ?? "")
                         .font(.body)
                         .foregroundColor(.secondary)
                 }
                 .padding(.vertical, 8)
             }
             .navigationTitle("Comments")
             .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.navigateToBack()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .tint(.black)
                        }
                    }
                }
            }
            .onAppear {
                if let post = viewModel.post {
                    viewModel.getComments(id: post.id)
                }
            }
            .overlay(
                viewModel.isLoading ? ProgressView("Loading...").scaleEffect(1.5) : nil
            )
        }
    }
}

#Preview {
    CommentsView(post: Post(id: 1, title: "", body: "", userId: 1))
}

