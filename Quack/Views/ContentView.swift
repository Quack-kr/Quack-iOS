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
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            NavigationStack(path: $coordinator.paths){
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    InitialView()
                        .background(Color.background.ignoresSafeArea(.all))
                        .navigationDestination(for: Destination.self) { destination in
                            ZStack {
                                Color.background.ignoresSafeArea()
                                
                                switch destination {
                                case .signUpView: SignUpView()
                                        .navigationBarBackButtonHidden()
                                case .tabBarView: TabBarView()
                                        .navigationBarBackButtonHidden()
                                case .alarmView: AlarmView()
                                        .navigationBarBackButtonHidden()
                                }
                            }
                        }
                }
            }
            .environmentObject(coordinator)
            .background(Color.background)
        }
    }
}

#Preview {
    ContentView()
        .background(Color.background)
}
