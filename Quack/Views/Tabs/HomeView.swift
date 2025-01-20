//
//  HomeView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false;
    
    var body: some View {
        VStack {
            HStack { // header
                Image(.logo)
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    HStack {
                        Text("동네설정")
                            .font(.theJamsil(.number(700)))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                        
                        Image(.chevronDown)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(.search)
                }
                
                Button(action: {}) {
                    Image(.notify)
                }
            }
            
            VStack {
                ZStack {
                    
                    HStack {
                        Spacer()
                        
                        Text("01")
                            .font(.pretendard(.number(600)))
                            .foregroundStyle(Color(hex: "#9A9A9A")) 
                        
                        Text("/05")
                            .font(.pretendard(.number(400)))
                            .foregroundStyle(Color(hex: "#9A9A9A"))
                    }
                }
                
                /*  */
                VStack(alignment: .leading) {
                    Text("꽥을 사용하는 방법!")
                        .font(.theJamsil(.number(700)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                    
                    Text("원하지 않는 음식을 뺴보세요!")
                        .font(.theJamsil(.number(500)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                }
            }
            
            VStack {
                HStack {
                    Text("급상승 가게 TOP10")
                        .font(.theJamsil(.number(700)))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
                
                HStack {
                    
                }
            }
            
            VStack {
                HStack {
                    Text("엄선한 오늘의 가게")
                        .font(.theJamsil(.number(700)))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
                
                HStack {
                    
                }
            }
            
            VStack {
                HStack {
                    Text("뭐 먹을지 고민될떈")
                        .font(.theJamsil(.number(700)))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    Spacer()
                }
                
                /* Thumbnail Image Area */
                ZStack {
                        Image(systemName: "")
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("니카이 우동")
                                Text("우동 한 그릇 위에 정성을 쌓다.")
                            }
                            
                            Spacer()
                            
                            // TODO: 광고 문구 추가
                        }
                }
                    
                /* Individual Menu Section */
                VStack {
                    HStack {
                        // Image()
                        
                        VStack(alignment: .leading) {
                            Text("자루우동")
                                .font(.theJamsil(.number(700)))
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Text("우동사리와 함꼐 바삭은 추가하면 딱이지")
                                .font(.pretendard(.number(500)))
                                .foregroundStyle(Color(hex: "#A8A7A1"))
                            
                            Text("10,000원")
                                .font(.pretendard(.number(600)))
                                .foregroundStyle(Color(hex: "#A8A7A1"))
                        }
                        
                        VStack {
                            Text("999+")
                                .font(.pretendard(.number(800)))
                                .foregroundStyle(.point)
                            
                            Text("미친맛")
                                .font(.pretendard(.number(600)))
                                .foregroundStyle(Color(hex: "#EFEEDF"))
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                HStack {
                    Text("동네 설정")
                        .font(.theJamsil(.number(700)))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                    
                    Spacer()
                    
                    Text("현재위치로 설정: 왕십리")
                        .font(.pretendard(.number(600)))
                        .foregroundStyle(.point)
                }
                
                Divider()
                    .background(Color(hex: "#68675E"))
                
                Grid {
                    GridRow {
                        
                    }
                }
                
                Spacer()
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Text("설정완료")
                        .frame(maxWidth: .infinity)
                        .font(.pretendard(.number(700)))
                        .foregroundStyle(Color(hex: "#171714"))
                        .padding(.vertical, 15)
                        .background(
                            Rectangle()
                                .cornerRadius(8)
                                .foregroundStyle(.point)
                        )
                }
            }
            .padding(.horizontal, 24)
            .presentationDetents([.fraction(0.67)])
            .presentationBackground(Color(hex:"#323230"))
        })
    }
}

#Preview {
    HomeView()
        .background(Color.background)
}
