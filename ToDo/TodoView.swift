//
//  TodoView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    @State private var isEditing: Bool = false
    var body: some View {
        NavigationStack {
            List(todos) { todo in
                Text(String(format: "Title:%@\nDetail:%@", todo.title, todo.detail))
            }
            .overlay {
                if todos.isEmpty {
                    ContentUnavailableView {
                        Label("No todos", systemImage: "list.bullet.clipboard")
                    }
                }
            }
            .background(Color(.systemGray2))
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Text("Todo")
                        .font(.title)
                        .foregroundStyle(Color(.systemGray2))
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        isEditing = !isEditing
                    }, label: {
                        Image(systemName: "plus")
                    }).sheet(isPresented: $isEditing, content: {
                        TodoEditor(todo: nil)
                    })
                })
            }
            .padding(10)
        }
        .tabItem {
            Label("Todo", systemImage: "list.dash")
        }
    }
}
