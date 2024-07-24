//
//  ContentView.swift
//  ToDo
//
//  Created by hyrf on 23/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            TodoView()
            SettingView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    @State private var isEditing: Bool = false
    var body: some View {
        NavigationStack {
            List(todos) { todo in
                Text(String(format: "%@ %@", todo.title, todo.detail))
            }
            .background(Color(.systemGray2))
            .frame(width: .infinity, height: .infinity, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Text("Todo")
                        .font(.title)
                        .foregroundStyle(Color(.systemGray2))
                        .frame(maxWidth: .infinity, alignment: .leading)
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
            Label("Menu", systemImage: "list.dash")
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct TodoEditor: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    let todo: Todo?
    private var editorTitle: String {
        todo == nil ? "Add Todo" : "Edit Todo"
    }
    @State private var title = ""
    @State private var detail = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Detail", text: $detail)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            save(context: modelContext)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private func save(context: ModelContext){
        let newTodo = Todo(title: title, detail: detail)
        context.insert(newTodo)
    }
}

#Preview {
    ContentView().modelContainer(for: Todo.self, inMemory: true)
}
