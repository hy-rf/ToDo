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
    }
}

#Preview {
    ContentView().modelContainer(for: Todo.self, inMemory: true)
}
