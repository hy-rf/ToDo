//
//  TodoViewModel.swift
//  ToDo
//
//  Created by hyrf on 29/07/2024.
//

import SwiftUI
import SwiftData

@Observable
class TodoViewModel {
    var modelContext: ModelContext? = nil
    var todos = [Todo]()
    var searchText: String = ""
    var filterBy: Filter = .all
    enum Filter: String, CaseIterable, Identifiable {
        case all, finished, unfinished
        var id: Self { self }
    }
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        fetchTodos()
    }
    func addTodo(_ item: Todo) {
        guard let modelContext else { return }
        modelContext.insert(item)
        fetchTodos()
    }
    func removeItem(_ indexSet: IndexSet) {
        guard let modelContext else { return }
        for index in indexSet {
            modelContext.delete(todos[index])
        }
        fetchTodos()
    }
    func fetchTodos() {
        guard let modelContext else { return }
        do {
            let descriptor = FetchDescriptor<Todo>()
            todos = try modelContext.fetch(descriptor)
        } catch {
            print("🔴 Error: \(error.localizedDescription)")
        }
    }
}
