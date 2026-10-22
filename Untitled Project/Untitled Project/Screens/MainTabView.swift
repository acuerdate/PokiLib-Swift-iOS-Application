//
//  SwiftUIView.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                HomeView()
            }
            Tab("Favourites", systemImage: "heart.fill"){
                EmptyView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
