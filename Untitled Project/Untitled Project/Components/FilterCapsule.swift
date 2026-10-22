//
//  FilterCapsule.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import SwiftUI

struct FilterCapsule: View {
    let types: NamedResource
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(types.name.capitalized)
                .foregroundStyle(isSelected ? .white : .secondary)
                .padding(.horizontal)
                .padding(.vertical, 7)
                .background(isSelected ? .blue.opacity(0.7) : .gray.opacity(0.15))
                .clipShape(.capsule)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
