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
        if self.todo.name != "" {
            "Edit Todo"
        } else {
            "Add Todo"
        }
    }
    @State var name: String
    @State var isEnd: Bool
    private var mode: String
    init(todo: Todo) {
        self.todo = todo
        self.name = todo.name
        self.isEnd = todo.isEnd
        if self.todo.name != "" {
            self.mode = "edit"
        } else {
            self.mode = "add"
        }
    }
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                TextField("Title", text: $name)
                if mode == "edit" {
                    Toggle(isOn: $isEnd, label: {
                        Text("Finish")
                    })
                }
            })
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    Text(editorTitle)
                })
                ToolbarItem(placement: .confirmationAction, content: {
                    if name == "" {
                        Button("Save", action: {
                            
                        }).disabled(true)
                    }
                    if mode == "edit" {
                        Button("Save", action: {
                            if name != "" {
                                todo.name = name
                                todo.isEnd = isEnd
                                dismiss()
                            }
                        })
                    }
                    else {
                        Button("Save", action: {
                            if name != "" {
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
        let newTodo = Todo(name: name)
        context.insert(newTodo)
    }
}
