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
            VStack(alignment: .leading, content: {
                Text("Setting")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color(.systemGray2))
                List(content: {
                    NavigationLink(destination: Text("Account"), label: {
                        Text("Account")
                    })
                })
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "magnifyingglass")
                })
            }
            .padding(10)
        })
        .tabItem {
            Label("Setting", systemImage: "list.dash")
        }
    }
}
