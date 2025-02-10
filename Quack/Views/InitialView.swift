//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import KakaoSDKUser

struct InitialView: View {
    @State private var isSheetPresented = true;
    @State private var isEveryPolicySelected = false;
    @State private var policyButtonColor = [Color](repeating: Color(hex:"#EFEEDF"), count: 4)
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.logoWithText)
                .renderingMode(.template)
                .foregroundStyle(Color(hex:"#EFEEDF"))
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                    user.socialLoginType = .kakao
                    isSheetPresented.toggle()
                }){
                    // TODO: 카카오 로그인 디자인 가이드 확인
                    HStack {
                        Spacer()
                        
                        Image(systemName: "message.fill")
                        
                        Text("카카오로 계속하기")
                            .font(.pretendard(.number(700), size: 14))
                        
                        Spacer()
                    }
                    .padding(16)
                    .background(
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundStyle(.point)
                    )
                    .foregroundStyle(Color(hex: "#171714"))
                }
                
                Button(action: {
                    
                }){
                    HStack {
                        Spacer()
                        
                        Text("추후 업데이트 예정")
                            .textModifier(.theJamsil, 700, 14, .white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                .opacity(0.5)
                
                Button(action: {
                    
                }){
                    HStack {
                        Spacer()
                        
                        Text("추후 업데이트 예정")
                            .textModifier(.theJamsil, 700, 14, .white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                .opacity(0.5)
                
                
                Button(action : {
                    coordinator.push(.tabBarView)
                }) {
                    Text("둘러보기")
                        .textModifier(.pretendard, 500, 14, "#A8A7A1")
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 29)
        .sheet(isPresented: $isSheetPresented, content:{ InitialBottomSheet(isEveryRequiredSelected: $isEveryPolicySelected, isSheetPresented: $isSheetPresented, policyButtonColor: $policyButtonColor)})
    }
}

#Preview {
    InitialView()
        .background(Color.background)
}
