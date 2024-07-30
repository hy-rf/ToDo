//
//  TodoLinkView.swift
//  ToDo
//
//  Created by hyrf on 30/07/2024.
//

import SwiftUI

struct TodoLink: View {
    @State var todo: Todo
    @Binding var selectedTodo: Todo?
    var body: some View {
        HStack(content: {
            NavigationLink(destination: {
                Text(String(format: "UUID: %@", todo.id as CVarArg))
                Text(String(format: "%@\n%@", todo.name, todo.startDate))
            }, label: {
                Text(String(format: "%@\n%@", todo.name, todo.startDate))
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .layoutPriority(1)
            if todo.isEnd {
                Image(systemName: "checkmark")
            }
            Button(action: {
                selectedTodo = todo
            }, label: {
                Image(systemName: "pencil")
            })
            .clipped().buttonStyle(BorderlessButtonStyle())
        })
    }
}
