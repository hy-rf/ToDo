//
//  SettingView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack(root: {
            List(content: {
                NavigationLink(destination: Text("Account"), label: {
                    Text("Account")
                })
            })
            .background(Color(.systemGray2))
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Text("Setting")
                        .font(.title)
                        .foregroundStyle(Color(.systemGray2))
                })
            }
            .padding(10)
        })
        .tabItem {
            Label("Setting", systemImage: "list.dash")
        }
    }
}
