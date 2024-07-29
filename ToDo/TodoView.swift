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
    @State private var isEdit: Bool = false
    @State private var selectedTodo: Todo? = nil
    @State private var searchText: String = ""
    @State private var filterBy: Filter = .all
    var body: some View {
        NavigationStack(root: {
            List(content: {
                ForEach(todos) { todo in
                    HStack(content: {
                        if (searchText.isEmpty || todo.title.lowercased().contains(searchText.lowercased())) {
                            if filterBy.rawValue == "all" || (filterBy.rawValue == "finished" && todo.isEnd == true) || (filterBy.rawValue == "unfinished" && todo.isEnd == false) {
                                Text(String(format: "Title:%@\nDetail:%@\nStart Date:%@", todo.title,todo.detail, todo.startDate as CVarArg))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                if todo.isEnd {
                                    Image(systemName: "checkmark")
                                }
                                Button(action: {
                                    selectedTodo = todo
                                }, label: {
                                    Image(systemName: "pencil")
                                })
                                .clipped().buttonStyle(BorderlessButtonStyle())
                                .frame(maxWidth: 100, alignment: .trailing)
                            }
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
#warning("add refresh function")
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
