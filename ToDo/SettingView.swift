//
//  SettingView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI

struct SettingView: View {
    @State private var isAutoDeleteOn: Bool
    init() {
        self.isAutoDeleteOn = false
    }
    var body: some View {
        NavigationStack(root: {
            Form(content: {
                Section("Data", content: {
                    Toggle(isOn: .constant(false), label: {
                        Text("iCloud sync")
                    })
                    Toggle(isOn: $isAutoDeleteOn, label: {
                        Text("Auto delete completed todo")
                    })
                    if isAutoDeleteOn {
                        Toggle(isOn: $isAutoDeleteOn, label: {
                            Text("Auto delete completed todo")
                        })
                    }
                })
            })
            .navigationTitle("Setting")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "magnifyingglass")
                })
            }
        })
        .tabItem {
            Label("Setting", systemImage: "list.dash")
        }
    }
}
