//
//  TodosView.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import SwiftUI
import Dependiject

struct TodosView: View {
    
    @Store var viewModel = Factory.shared.resolve(MainTabbarViewModel.self)
    
    var body: some View {
        NavigationView {
            List(viewModel.todos, id: \.id) { todo in
                HStack {
                    Text(todo.title ?? "")
                        .font(.headline)
                    Spacer()
                    if todo.completed == true {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("To-Do List")
            .onAppear {
                viewModel.getTodos()
            }
            .overlay(
                viewModel.isLoading ? ProgressView("Loading...").scaleEffect(1.5) : nil
            )
        }
    }
}

#Preview {
    TodosView()
}
