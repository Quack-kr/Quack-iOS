//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI

struct InitialView: View {
    @State private var isSheetPresented = true;
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.logoWithText)
                .renderingMode(.template)
                .foregroundStyle(Color(hex:"#EFEEDF"))
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                }){
                    // TODO: 카카오 로그인 이미지로 넣기
                    VStack {
                        HStack {
                            Image(systemName: "message.fill")
                            
                            Spacer()
                            
                            Text("카카오로 로그인")
                            
                            Spacer()
                        }
                        .foregroundStyle(Color(hex: "#171714"))
                        .padding(.vertical, 16)
                    }
                    .background(
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundStyle(.point)
                    )
                    .padding(.horizontal, 16)
                    
                }
                
                Button(action: {
                    
                }){
                    Rectangle()
                        .cornerRadius(8)
                        .frame(height: 50)
                        .padding(.horizontal, 16)
                        .foregroundStyle(.white)
                    
                }
                
                Button(action: {
                    
                }){
                    Rectangle()
                        .cornerRadius(8)
                        .frame(height: 50)
                        .padding(.horizontal, 16)
                        .cornerRadius(8)
                        .foregroundStyle(.white)
                }
                
                
                Button(action : {
                    coordinator.push(.tabBarView)
                }) {
                    Text("둘러보기")
                        .foregroundStyle(Color(hex:"#A8A7A1"))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 29)
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                // TODO: sheet close 기능 구현하기? -> 현재 전체 화면에 다 적용되어 있음
                Capsule()
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                    .frame(width: 40, height: 4)
                    .padding(.top, 16)
                
                Spacer()
                
                Text("약관동의")
                    .padding(.bottom, 16)
                    .font(.pretendard(.number(800), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                VStack {
                    VStack(spacing: 16) {
                        Button(action: {}) {
                            HStack {
                                Image(.checkCircle)
                                    .font(.system(size: 24))

                                Text("이용약관 모두 동의")
                                    .font(.pretendard(.number(500), size: 14))
                                
                                Spacer()
                            }
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                            .padding(.leading, 10)
                            .padding(.vertical, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 110)
                                    .stroke(Color(hex:"#EFEEDF"), lineWidth: 1) //TODO: stroke 색상 변경
                            )
                            .onTapGesture {
                                // TODO: 모두 동의 기능 추가하기
                            }
                        }
                        
                        VStack(spacing: 24) {
                            HStack {
                                Image(.checkCircle)
                                
                                Text("서비스 이용약관 동의 (필수)")
                                    .font(.pretendard(.number(500), size: 14))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Spacer()
                                
                                Image(.chevronRight)
                            }
                            
                            HStack {
                                Image(.checkCircle)
                                
                                Text("개인정보 수집 및 이용 동의 (필수)")
                                    .font(.pretendard(.number(500), size: 14))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Spacer()
                                
                                Image(.chevronRight)
                            }
                            
                            HStack {
                                Image(.checkCircle)
                                
                                Text("위치정보 서비스 이용약관 동의 (필수)")
                                    .font(.pretendard(.number(500), size: 14))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Spacer()
                                
                                Image(.chevronRight)
                            }
                            
                            HStack {
                                Image(.checkCircle)
                                
                                Text("마케팅 정보 활용 동의 (선택)")
                                    .font(.pretendard(.number(500), size: 14))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Spacer()
                                
                                Image(.chevronRight)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 8)
                        
                    }
                }
                .padding(.horizontal, 24)
                /*
                VStack(spacing: 16) {
                    Button(action: {}) {
                        HStack {
                            Image(.checkCircle)
                                .font(.system(size: 24))

                            Text("이용약관 모두 동의")
                            
                            Spacer()
                        }
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                        .padding(.leading, 10)
                        .padding(.vertical, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 110)
                                .stroke(Color(hex:"#EFEEDF"), lineWidth: 1) //TODO: stroke 색상 변경
                        )
                        .padding(.horizontal, 24)
                        .onTapGesture {
                            // TODO: 모두 동의 기능 추가하기
                        }
                    }
                    
                    VStack(spacing: 24) {
                        HStack {
                            Image(.checkCircle)
                            
                            Text("서비스 이용약관 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.chevronRight)
                        }
                        
                        HStack {
                            Image(.checkCircle)
                            
                            Text("개인정보 수집 및 이용 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.chevronRight)
                        }
                        
                        HStack {
                            Image(.checkCircle)
                            
                            Text("위치정보 서비스 이용약관 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.chevronRight)
                        }
                        
                        HStack {
                            Image(.checkCircle)
                            
                            Text("마케팅 정보 활용 동의 (선택)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.chevronRight)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 8)
                    
                }
                */
                
                Text(
                     """
                     \'선택\' 항목에 동의하지 않아도 서비스 이용이 가능합니다.
                     개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며,
                     동의 거부시 서비스 이용이 제한됩니다.
                     """
                )
                .font(.pretendard(.number(400), size: 10))
                .foregroundStyle(Color(hex:"#A8A7A1"))
                .multilineTextAlignment(.center)
//                .padding(.horizontal, 72)
                
                Spacer()
                
                Button(action: {
                    coordinator.push(.signUpView)
                }){
                        Text("다음으로")
                            .frame(maxWidth: .infinity)
                            .font(.pretendard(.number(700), size: 16))
                            .foregroundStyle(Color(hex:"#171714"))
                            .padding(.vertical, 16)
                            .background(
                                Rectangle()
                                    .cornerRadius(8)
                                    .foregroundStyle(.point) // TODO: foregroundStyle로 색상 변경 시 disabled 적용되는 법
                            )
                }
                .padding(.horizontal, 16)
//                .disabled(true)
            }
            .frame(maxWidth: .infinity)
            .presentationDetents([.fraction(0.67)])
            .presentationBackground(Color(hex:"#323230"))
        })
    }
}

#Preview {
    InitialView()
        .background(Color.background)
}
