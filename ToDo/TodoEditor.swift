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
    @State var title: String
    @State var detail: String
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                TextField("Title", text: $title)
                TextField("Detail", text: $detail)
            })
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    Text(editorTitle)
                })
                ToolbarItem(placement: .confirmationAction, content: {
                    if let todo {
                        Button("Save", action: {
                            todo.title = title
                            todo.detail = detail
                            dismiss()
                        })
                    }
                    else {
                        Button("Save", action: {
                            save(context: modelContext)
                            dismiss()
                        })
                    }
                })
            }
        })
    }
    
    private func save(context: ModelContext){
        let newTodo = Todo(title: title, detail: detail)
        context.insert(newTodo)
    }
}
