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
    var user = CurrentUser() // TODO: 현재 유저에 대한 정보를 어떻게 하위 뷰에게 전달 할 지

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)

            NavigationStack(path: $coordinator.paths) {
                ZStack {
                    Color.background.ignoresSafeArea(.all)

                    InitialView()
                        .background(Color.background.ignoresSafeArea(.all))
                        .navigationDestination(for: Destination.self) { destination in
                            ZStack {
                                Color.background.ignoresSafeArea()

                                switch destination {
                                case .signUpView:
                                    SignUpView()
                                case .tabBarView:
                                    TabBarView()
                                case .alarmView:
                                    AlarmView()
                                }
                            }
                            .navigationBarBackButtonHidden()
                        }
                }
            }
            .environmentObject(user)
            .environmentObject(coordinator)
            .background(Color.background)
        }
    }
}

#Preview {
    ContentView()
        .background(Color.background)
}
