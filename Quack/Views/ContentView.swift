//
//  ContentView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var coordinator = Coordinator<Destination>()
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
        NavigationStack(path: $coordinator.paths){
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                InitialView()
            }
            .navigationDestination(for: Destination.self) { destination in
                ZStack {
                    Color.background.ignoresSafeArea()
                    
                    switch destination {
                    case .signUpView: SignUpView()
                            .navigationBarBackButtonHidden()
                    case .tabBarView: TabBarView()
                            .navigationBarBackButtonHidden()
                    }
                }

            }
        }
        .environmentObject(coordinator)
    }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
