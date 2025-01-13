//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI

import SwiftUI

struct InitialView: View {
    @State private var isSheetPresented = true;
    
    var body: some View {
        VStack {
            // TODO: Logo 이미지 넣기
            Image(.logowithtext)
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                }){
                    // TODO: 카카오 로그인 이미지로 넣기
                    ZStack {
                        Rectangle()
                            .cornerRadius(8)
                            .frame(height: 50)
                            .padding(.horizontal, 16)
                    }
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
                
                NavigationLink("둘러보기", destination: SignUpView())
                    .foregroundStyle(Color(hex:"#A8A7A1"))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top,200)
        .padding(.bottom, 50)
        .sheet(isPresented: $isSheetPresented, onDismiss: didDismiss, content: {
            VStack {
                // TODO: sheet close 기능 구현하기? -> 현재 전체 화면에 다 적용되어 있음
                Capsule()
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                    .frame(height: 8)
                    .padding(.top, 16)
                    .padding(.horizontal, 168)
                
                Spacer()
                
                Text("약관동의")
                    .padding(.bottom, 16)
                    .font(.pretendard(.number(700), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                VStack() {
                    Button(action: {}) {
                        HStack {
                            // TODO: 체크 이미지 넣기
                            Image(.checkcircle)
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
                        .padding(.bottom, 16)
                        .onTapGesture {
                            // TODO: 모두 동의 기능 추가하기
                        }
                    }
                    
                    VStack(spacing: 24) {
                        HStack {
                            Image(.checkcircle)
                            
                            Text("서비스 이용약관 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.rightshevron)
                        }
                        
                        HStack {
                            // TODO: 체크이미지 추가
                            Image(.checkcircle)
                            
                            Text("개인정보 수집 및 이용 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            // TODO: 화살표 이미지 넣기
                            Image(.rightshevron)
                        }
                        
                        HStack {
                            // TODO: 체크이미지 추가
                            Image(.checkcircle)
                            
                            Text("위치정보 서비스 이용약관 동의 (필수)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            // TODO: 화살표 이미지 넣기
                            Image(.rightshevron)
                        }
                        
                        HStack {
                            // TODO: 체크이미지 추가
                            Image(.checkcircle)
                            
                            Text("마케팅 정보 활용 동의 (선택)")
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            // TODO: 화살표 이미지 넣기
                            Image(.rightshevron)
                        }
                    }
                    .padding(.horizontal, 34)
                    .padding(.bottom, 8)
                    
                }
                
                Text(
                     """
                     \'선택\' 항목에 동의하지 않아도 서비스 이용이 가능합니다.
                     개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며,
                     동의 거부시 서비스 이용이 제한됩니다.
                     """
                )
                .font(.pretendard(.number(400), size: 10))
                .foregroundStyle(Color(hex:"#EFEEDF"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 72)
                .padding(.bottom, 24)
                .padding(.top, 36)
                
                
                Button(action: {
                    
                }){
                        Text("다음으로")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                            .padding(.vertical, 16)
                            .background(
                                Rectangle()
                                    .cornerRadius(8)
                                    .foregroundStyle(.point)
                            )
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity)
            .presentationDetents([.fraction(0.67)])
            .presentationBackground(Color(hex:"#323230"))
        })
    }
    
    func didDismiss() {}
}

#Preview {
    InitialView()
        .background(Color.background)
}
