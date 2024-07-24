//
//  TodoEditor.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI
import SwiftData

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
                ToolbarItem(placement: .principal, content: {
                    Text(editorTitle)
                })
                ToolbarItem(placement: .confirmationAction, content: {
                    Button("Save") {
                        withAnimation {
                            save(context: modelContext)
                            dismiss()
                        }
                    }
                })
            }
        }
    }
    
    private func save(context: ModelContext){
        let newTodo = Todo(title: title, detail: detail)
        context.insert(newTodo)
    }
}
