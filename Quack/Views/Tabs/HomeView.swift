//
//  HomeView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var isSheetPresented = false;
    @Binding var selection: Int;
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                /* HomeView Header */
                HStack {
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
                        Button(action: {
                            selection = 1; // TODO: Button Tap Gesture 종료 전에 화면 전환이 됨.
                        }) {
                            Image(.search)
                                .frame(height: 24)
                        }
                        
                        Button(action: {
                            coordinator.push(.alarmView)
                        }) {
                            Image(.notify)
                                .frame(height: 24)
                        }
                    }
                }
                .padding(.leading, 8)
                
                /* HomeView Banner */
                VStack(spacing: 20) {
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
                .padding(.bottom, 8)
                
                VStack(spacing: 32) {
                /* HomeView Ranking */
                VStack {
                    HStack {
                        Text("급상승 가게 TOP10")
                            .font(.theJamsil(.number(700)))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                        
                        Image(.chevronRight)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            VStack(alignment: .leading) {
                                ZStack(alignment: .leading) {
                                    HStack {
                                        Spacer()
                                        
                                        Image(.dummyMenu)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 140)
                                    }
                                    VStack {
                                        Spacer()
                                        
                                        HStack {
                                            Text("1")
                                                .font(.theJamsil(.number(700), size: 40))
                                                .foregroundStyle(Color(hex:"#EFEEDF"))
                                        }
                                    }
                                }
                                .frame(width: 143, height: 155) // TODO: fix hard coding

                                
                                VStack(alignment: .leading) {
                                    Text("김밥천국")
                                        .font(.pretendard(.number(600), size: 14))
                                        .foregroundStyle(Color(hex:"#EFEEDF"))
                                    
                                    Text("분식 | 왕십리")
                                        .font(.pretendard(.number(600), size: 12))
                                        .foregroundStyle(Color(hex:"#A8A7A1"))
                                    
                                    HStack {
                                        Text("816m")
                                            .foregroundStyle(.point)
                                        
                                        Text("평균 28,000원")
                                            .foregroundStyle(Color(hex:"#A8A7A1"))
                                    }
                                        .font(.pretendard(.number(600), size: 12))
                                }
                                .padding(.leading, 3)
                            }
                        }
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
                    ScrollView(.horizontal) {
                        HStack {
                            VStack(alignment: .leading) {
                                Image(.dummyMenu)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140)
                                
                                VStack(alignment: .leading) {
                                    Text("김밥천국")
                                        .font(.pretendard(.number(600), size: 14))
                                        .foregroundStyle(Color(hex:"#EFEEDF"))
                                    
                                    Text("분식 | 왕십리")
                                        .font(.pretendard(.number(600), size: 12))
                                        .foregroundStyle(Color(hex:"#A8A7A1"))
                                    
                                    HStack {
                                        Text("816m")
                                            .foregroundStyle(.point)
                                        
                                        Text("평균 28,000원")
                                            .foregroundStyle(Color(hex:"#A8A7A1"))
                                    }
                                        .font(.pretendard(.number(600), size: 12))
                                }
                            }
                        }
                    }
                }
                
                /* HomeView Recommand */
                VStack {
                    HStack {
                        Text("뭐 먹을지 고민될떈")
                            .font(.theJamsil(.number(700), size: 18))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                    }
                    
                    /* Thumbnail Image Area */
                    ZStack(alignment: .bottom) {
                            Image(.dummyThumbnail)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [Color(hex:"#171714").opacity(0), Color(hex:"#171714").opacity(1)]), startPoint: .top, endPoint: .bottom)
                                )
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text("니카이 우동")
                                    .font(.theJamsil(.number(700), size: 20))
                                    .foregroundStyle(.white)
                                
                                Text("우동 한 그릇 위에 정성을 쌓다.")
                                    .font(.theJamsil(.number(400), size: 16))
                                    .foregroundStyle(Color(hex: "#EFEEDF"))
                            }
                            
                            Spacer()
                            
                            Text("광고 ⓘ")
                                .font(.pretendard(.number(500), size: 10))
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    }
                    
                    /* Individual Menu Section */
                    VStack {
                        HStack {
                            Image(.dummyMenu)
                            
                            VStack(alignment: .leading) {
                                Text("자루우동")
                                    .font(.theJamsil(.number(700), size: 16))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Text("우동사리와 함꼐 바삭은 추가하면 딱이지")
                                    .font(.pretendard(.number(500), size: 12))
                                    .foregroundStyle(Color(hex: "#A8A7A1"))
                                
                                Text("10,000원")
                                    .font(.pretendard(.number(600), size: 12))
                                    .foregroundStyle(Color(hex: "#A8A7A1"))
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("999+")
                                    .font(.pretendard(.number(800), size: 14))
                                    .foregroundStyle(.point)
                                
                                Text("미친맛")
                                    .font(.pretendard(.number(600), size: 12))
                                    .foregroundStyle(Color(hex: "#EFEEDF"))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(Color(hex:"#323230"))
                                    )
                            }
                        }
                    }
                }
            }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                Capsule()
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                    .frame(width: 40, height: 4)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                
                HStack {
                    Text("동네 설정")
                        .font(.theJamsil(.number(700),size: 18))
                        .foregroundStyle(Color(hex: "#EFEEDF"))
                    
                    Spacer()
                    
                    Text("현재위치로 설정: 왕십리")
                        .font(.pretendard(.number(600), size: 14))
                        .foregroundStyle(.point)
                }
                
                Divider()
                    .background(Color(hex: "#68675E"))
                    .padding(.bottom, 24)
                
                Grid(alignment: .leading, horizontalSpacing: 56, verticalSpacing: 32) {
                    GridRow {
                        Text("용산")
                        
                        Text("이태원")
                        
                        Text("한남")
                    }
                    
                    GridRow {
                        Text("홍대")
                        
                        Text("합정")
                        
                        Text("연남")
                        
                        Text("망원")
                    }
                    
                    GridRow {
                        Text("성수")
                        
                        Text("건대")
                        
                        Text("왕십리")
                        
                        Text("신당")
                    }
                    
                    GridRow {
                        Text("종로")
                        
                        Text("을지로")
                        
                        Text("안국")
                        
                        Text("명동")
                    }
                    
                    GridRow {
                        Text("깅님")
                        
                        Text("압구정")
                        
                        Text("잠실")
                    }
                    
                    GridRow {
                        Text("여의도")
                        
                        Text("영등포")
                        
                        Text("문래")
                    }
                }
                .font(.pretendard(.number(500), size: 15))
                .foregroundStyle(Color(hex:"#68675E"))
                
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
            .presentationDetents([.fraction(0.75)])
            .presentationBackground(Color(hex:"#323230"))
        })
    }
}

#Preview {
    HomeView(selection: .constant(0))
        .background(Color.background)
}
