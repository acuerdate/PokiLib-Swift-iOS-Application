//
//  SearchField.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation
import SwiftUI


struct SearchField: View {
    @State var searchText = ""
    
    var body: some View{
            HStack(spacing: 5) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField(
                    "Find your Pokemon!",
                    text: $searchText
                )
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(.gray.opacity(0.15))
            .cornerRadius(15)
            .padding(.vertical)
    }
}

#Preview{
    HomeView()
}
