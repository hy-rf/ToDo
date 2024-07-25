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
    @State private var isEdit: Bool = false
    @State private var selectedTodo: Todo? = nil
    var body: some View {
        NavigationView(content: {
            VStack(content: {
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Text(String(format: "Title:%@\nDetail:%@", todo.title, todo.detail))
                                .frame(maxWidth: .infinity)
#warning("Fix some time todo to edit not appear in sheet and button click outside pencil image")
                            Button(action: {
                                selectedTodo = todo
                                isEdit = true
                            }, label: {
                                Image(systemName: "pencil").frame(maxWidth: .infinity)
                            })
                        }
                    }
                    .onDelete(perform: removeTodo)
                }
                .overlay {
                    if todos.isEmpty {
                        ContentUnavailableView {
                            Label("No todos", systemImage: "list.bullet.clipboard")
                        }
                    }
                }
            })
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        selectedTodo = nil
                        isEdit = true
                    }, label: {
                        Image(systemName: "plus")
                    }).sheet(isPresented: $isEdit, content: {
                        TodoEditor(todo: selectedTodo, title: selectedTodo?.title ?? "", detail: selectedTodo?.detail ?? "")
                    })
                })
            }
        })
        .tabItem {
            Label("Todo", systemImage: "house")
        }
    }
    func removeTodo(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    TodoView().modelContainer(for: Todo.self, inMemory: true)
}
