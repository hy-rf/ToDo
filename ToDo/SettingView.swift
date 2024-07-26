//
//  SettingView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView(content: {
            List(content: {
                NavigationLink(destination: Text("Account"), label: {
                    Text("Account")
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
