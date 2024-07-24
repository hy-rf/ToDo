//
//  SettingView.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView() {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .background(Color(.systemGray2))
            Text("Setting")
                .font(.title)
                .foregroundStyle(Color(.systemGray2))
        }
        .frame(width: 100, height: 500)
        .padding(.leading, 10)
        .tabItem {
            Label("Setting", systemImage: "list.dash")
        }
    }
}
