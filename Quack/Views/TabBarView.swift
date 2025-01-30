//
//  TabBarView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var tabType : TabContentType = .home;
    @State private var selection = 0;
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(resource: .raisinBlack)
    }
    
    var body: some View {
            TabView(selection: $selection,
                    content:  {
                
                Group {
                    HomeView()
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

                    
                    SubstractView()
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
    }
    
    enum TabContentType {
        case home, search, substract, my
    }
    
    @ViewBuilder
    func tabContent(type: TabContentType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .substract:
            SubstractView()
        case .my:
            MyView()
        }
    }
}

#Preview {
    TabBarView()
        .background(Color.background)
}
