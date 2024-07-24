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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MenuView: View {
    @State var isSearchBarShow: Bool = true
    @State var input: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Menu")
                    .font(.title)
                    .foregroundStyle(Color(.systemGray2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView {
                    ForEach((1...100), id: \.self) {
                        if input != "" {
                            if String("\($0)") == input {
                                Text("\($0)")
                                    .frame(width: 300)
                            }
                        }
                        else {
                            Text("\($0)")
                                .frame(width: 300)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    if isSearchBarShow {
                        TextField("id", text: $input)
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
            .padding(10)
        }
        .tabItem {
            Label("Menu", systemImage: "list.dash")
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

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

#Preview {
    ContentView()
}
