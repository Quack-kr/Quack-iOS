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
        ScrollView {
            /* HomeView Header */
            HStack { // header
                Image(.logo)
                    .frame(height: 35)
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    HStack {
                        Text("동네설정")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                        
                        Image(.chevronDown)
                            .frame(height: 12)
                    }
                    .padding(.leading, 12)
                    .padding(.trailing, 10.5)
                    .padding(.vertical, 8)
                    .background(
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundStyle(Color(hex:"#2A2925"))

                    )
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Image(.search)
                            .frame(height: 24)
                    }
                    
                    Button(action: {}) {
                        Image(.notify)
                            .frame(height: 24)
                    }
                }
            }
            .padding(.leading, 8)
            
            /* HomeView Banner */
            VStack {
                /* HomeView Recommand */
                VStack {
                    ZStack {
                        Image(.logo)
                            .frame(height: 400)
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                // TODO: 특정 테스트 색상 변경
                                // TODO: 총 갯수 및 현재 위치 동적으로 변경
                                Text("01 / 05")
                                    .font(.pretendard(.number(600), size: 10))
                                    .foregroundStyle(Color(hex: "#A8A7A1"))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .foregroundStyle(Color(hex:"#171714"))
                                    )
                                
//                                Text("/05")
//                                    .font(.pretendard(.number(500)))
//                                    .foregroundStyle(Color(hex: "#9A9A9A"))
                            }
                            .padding(.trailing, 12)
                            .padding(.bottom, 8)
                            
                        }
                    }
                    .overlay(
                        // padding 적용이 제대로 되지 않는 현상 -> Image width 제거로 해결
                        // TODO: why?
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex:"#68675E"), lineWidth: 2)
                        
                    )
                }
                
                /* HomeView Manual */
                HStack {
                    VStack(alignment: .leading) {
                        Text("꽥을 사용하는 방법!")
                            .font(.theJamsil(.number(700), size: 18))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                        
                        Text("원하지 않는 음식을 뺴보세요!")
                            .font(.theJamsil(.number(500), size: 14))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 24.5)
                    
                    Spacer()
                }
                .background(Color(hex:"#2A2925"))
                .cornerRadius(8)
                
            }
            
            /* HomeView Ranking */
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
            
            /* HomeView Today */
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
            
            /* HomeView Recommand */
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
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
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
