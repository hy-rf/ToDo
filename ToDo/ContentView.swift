//
//  ContentView.swift
//  ToDo
//
//  Created by hyrf on 23/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MenuView()
            SettingView()
        }
    }
}

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .background(Color(.systemGray2))
            Text("Menu")
                .font(.title)
                .foregroundStyle(Color(.systemGray2))
        }
        .tabItem {
            Label("Menu", systemImage: "list.dash")
        }
    }
}

struct SettingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
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

#Preview {
    ContentView()
}
