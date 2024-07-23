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
    @State var isSearchBarShow: Bool = false
    @State var input: String = ""
    var body: some View {
        NavigationStack {
            Text("Menu")
                .font(.title)
                .foregroundStyle(Color(.systemGray2))
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        if isSearchBarShow {
                            TextField("input", text: $input)
                        }
                        else {
                            Text("a tool")
                        }
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button(action: {
                            isSearchBarShow = !isSearchBarShow
                        }, label: {
                            Image(systemName: "magnifyingglass")
                        })
                    })
                }
        }
        .tabItem {
            Label("Menu", systemImage: "list.dash")
        }
        
    }
}

struct SettingView: View {
    var body: some View {
        NavigationStack() {
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
