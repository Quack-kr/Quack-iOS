//
//  TabBarView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var selection = 0;
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(resource: .raisinBlack)
    }
    
    var body: some View {
            TabView(selection: $selection,
                    content:  {
                
                Group {
                    HomeView(selection: $selection)
                        .tabItem {
                            VStack {
                                Image(.home)
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .frame(width: 24)
                                
                                Text("홈")
                                    .font(.pretendard(.number(400)))
                                    .foregroundStyle(Color(hex: "#EFEEDF"))
                            } }.tag(0)
                        .background(Color.background)
                    
                    SearchView()
                        .tabItem {
                            Image(.search)
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .frame(width: 24)
                            
                            Text("검색")
                                .font(.pretendard(.number(400)))
                                .foregroundStyle(Color(hex: "#EFEEDF"))
                        }.tag(1)
                        .background(Color.background)

                    
                    SubstractView(selection: $selection)
                        .tabItem {
                            Image(.substract)
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .frame(width: 24)
                            
                            Text("뺴기")
                                .font(.pretendard(.number(400)))
                                .foregroundStyle(Color(hex: "#EFEEDF"))
                        }.tag(2)
                        .background(Color.background)

                    MyView()
                        .tabItem {
                            Image(.my)
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .frame(width: 24)
                            
                            Text("마이")
                                .font(.pretendard(.number(400)))
                                .foregroundStyle(Color(hex: "#EFEEDF"))
                        }.tag(3)
                        .background(Color.background)
                }
                .toolbarBackground(.raisinBlack, for: .tabBar)
            })
            .accentColor(Color(hex:"#EFEEDF"))
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    TabBarView()
        .background(Color.background)
}
