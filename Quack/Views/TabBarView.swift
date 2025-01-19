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
            HomeView()
                .tabItem {
                    VStack {
                        Image(.checkCircle) // TODO: 홈이미지 추가
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .frame(width: 24)
                        
                        Text("홈")
                            .font(.pretendard(.number(400)))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                    } }.tag(0)
            
            SearchView()
                .tabItem {
                    Image(.checkCircle) // TODO: 홈이미지 추가
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .frame(width: 24)
                    
                    Text("홈")
                        .font(.pretendard(.number(400)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                }.tag(1)
            
            SubstractView()
                .tabItem {
                    Image(.checkCircle) // TODO: 홈이미지 추가
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .frame(width: 24)
                    
                    Text("홈")
                        .font(.pretendard(.number(400)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                }.tag(2)
            SubstractView()
                .tabItem {
                    Image(.checkCircle) // TODO: 홈이미지 추가
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .frame(width: 24)
                    
                    Text("홈")
                        .font(.pretendard(.number(400)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                }.tag(3)
        })
        .accentColor(Color(hex:"#EFEEDF"))
        
//        ZStack {
//            tabContent(type: tabType)
//            
//            VStack {
//                Spacer()
//                
//                HStack {
//                    Button (action: {
//                        tabType = .home;
//                    }) {
//                        VStack {
//                            Image(.checkCircle) // TODO: 홈이미지 추가
//                                .frame(width: 24)
//                            
//                            Text("홈")
//                                .font(.pretendard(.number(400)))
//                                .foregroundStyle(Color(hex: "#EFEEDF"))
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button (action: {
//                        tabType = .search;
//                    }) {
//                        VStack {
//                            Image(.checkCircle) // TODO: 검색이미지 추가
//                                .frame(width: 24)
//                            
//                            Text("검색")
//                                .font(.pretendard(.number(400)))
//                                .foregroundStyle(Color(hex: "#EFEEDF"))
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button (action: {
//                        tabType = .substract;
//                    }) {
//                        VStack {
//                            Image(.checkCircle) // TODO: 빼기 이미지 추가
//                                .frame(width: 24)
//                            
//                            Text("빼기")
//                                .font(.pretendard(.number(400)))
//                                .foregroundStyle(Color(hex: "#EFEEDF"))
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button (action: {
//                        tabType = .my;
//                    }) {
//                        VStack {
//                            Image(.checkCircle) // TODO: 마이이미지 추가
//                                .frame(width: 24)
//                            
//                            Text("마이")
//                                .font(.pretendard(.number(400)))
//                                .foregroundStyle(Color(hex: "#EFEEDF"))
//                        }
//                    }
//                    
//                }
//                .padding(.top, 8)
//                .padding(.horizontal, 43)
//                .frame(maxWidth: .infinity)
//                .ignoresSafeArea(edges: .bottom)
//                .background(Color(hex:"#21211D"))
//            }
//        }
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
