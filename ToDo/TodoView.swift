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
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack(root: {
            if todos.isEmpty {
                ContentUnavailableView {
                    Label("No todos", systemImage: "list.bullet.clipboard")
                }
            }
            List(content: {
                ForEach(todos) { todo in
                    HStack(content: {
                        if (searchText.isEmpty || todo.title.lowercased().contains(searchText.lowercased())) {
                            Text(String(format: "Title:%@\nDetail:%@\nStart Date:%@", todo.title,todo.detail, todo.startDate as CVarArg))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Button(action: {
                                selectedTodo = todo
                            }, label: {
                                Image(systemName: "pencil")
                            })
                            .clipped().buttonStyle(BorderlessButtonStyle())
                            .frame(maxWidth: 100, alignment: .trailing)
                        }
                    })
                }
                .onDelete(perform: removeTodo)
            })
            .scrollIndicators(.hidden)
            .searchable(text: $searchText, placement: .toolbar, prompt: Text("Search Title..."))
            .navigationTitle("Todo")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        selectedTodo = Todo(title: "", detail: "")
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            })
        })
        .refreshable {
            print("todo refreshed")
        }
        .sheet(item: $selectedTodo, content: { item in
            TodoEditor(todo: item)
                .presentationDetents([.medium, .large])
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
