//
//  ContentView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            // InitialView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
