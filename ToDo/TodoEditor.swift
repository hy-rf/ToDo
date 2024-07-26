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
    let todo: Todo
    private var editorTitle: String {
        if self.todo.title != "" && self.todo.detail != "" {
            "Edit Todo"
        } else {
            "Add Todo"
        }
    }
    @State var title: String
    @State var detail: String
    private var mode: String
    init(todo: Todo) {
        self.todo = todo
        self.title = todo.title
        self.detail = todo.detail
        if self.todo.title != "" && self.todo.detail != "" {
            self.mode = "edit"
        } else {
            self.mode = "add"
        }
    }
    
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
                    if title == "" && detail == "" {
                        Button("Save", action: {
                            
                        }).disabled(true)
                    }
                    if mode == "edit" {
                        Button("Save", action: {
                            if title != "" && detail != "" {
                                todo.title = title
                                todo.detail = detail
                                dismiss()
                            }
                        })
                    }
                    else {
                        Button("Save", action: {
                            if title != "" && detail != "" {
                                save(context: modelContext)
                                dismiss()
                            }
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
