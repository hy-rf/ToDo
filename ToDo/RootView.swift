//
//  ContentView.swift
//  ToDo
//
//  Created by hyrf on 23/07/2024.
//

import SwiftUI
import SwiftData

struct RootView: View {
    var body: some View {
        TabView {
            TodoView()
            SettingView()
        }
    }
}

#Preview {
    RootView().modelContainer(for: Todo.self, inMemory: true)
}
