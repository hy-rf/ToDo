//
//  TodoView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    enum Filter: String, CaseIterable, Identifiable {
        case all, finished, unfinished
        var id: Self { self }
    }
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    @State private var selectedTodo: Todo? = nil
    @State private var searchText: String = ""
    @State private var filterBy: Filter = .all
    var body: some View {
        NavigationStack(root: {
            List(content: {
                ForEach(todos) { todo in
                    if (searchText.isEmpty || todo.name.lowercased().contains(searchText.lowercased())) {
                        if filterBy == .all || (filterBy == .finished && todo.isEnd == true) || (filterBy == .unfinished && todo.isEnd == false) {
                            TodoLink(todo: todo, selectedTodo: $selectedTodo)
                        }
                    }
                }
                .onDelete(perform: removeTodo)
            })
            .scrollIndicators(.hidden)
            .searchable(text: $searchText, placement: .toolbar, prompt: Text("Search..."))
            .navigationTitle("Todo")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        selectedTodo = Todo(name: "")
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
                ToolbarItem(placement: .secondaryAction, content: {
                    Picker(selection: $filterBy, content: {
                        ForEach(Filter.allCases) { filterOption in
                            Text(filterOption.rawValue)
                        }
                    }, label: {
                    })
                })
            })
        })
        .refreshable {
            searchText = ""
            filterBy = .all
        }
        .sheet(item: $selectedTodo, content: { item in
            TodoEditorView(todo: item)
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
