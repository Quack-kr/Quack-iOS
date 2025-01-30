//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI

struct InitialView: View {
    private var policyTitle = [
        "서비스 이용약관 동의 (필수)",
        "개인정보 수집 및 이용 동의 (필수)",
        "위치정보 서비스 이용약관 동의 (필수)",
        "마케팅 정보 활용 동의 (선택)"
    ];
    @State private var isSheetPresented = true;
    @State private var isAllPolicyButtonsSelected = false;
    @State private var policyButtonColor = [Color](repeating: Color(hex:"#EFEEDF"), count: 4)
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
                    isSheetPresented.toggle()
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
                    Text("추후 업데이트 예정")
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 100)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                
                Button(action: {
                    
                }){
                    Text("추후 업데이트 예정")
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 100)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                
                
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
                        Button(action: {
                            isAllPolicyButtonsSelected = true

                            for ind in policyButtonColor.indices {
                                policyButtonColor[ind] = Color(.point)
                            }
                        }) {
                            HStack {
                                Image(.checkCircle)
                                    .renderingMode(.template)
                                    .font(.system(size: 24))
                                
                                Text("이용약관 모두 동의")
                                    .font(.pretendard(.number(500), size: 14))
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                            .padding(.vertical, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 110)
                                    .stroke(isAllPolicyButtonsSelected ? Color.point : Color(hex:"#EFEEDF"), lineWidth: 1)
                            )
                        }
                        .foregroundStyle(isAllPolicyButtonsSelected ? Color.point : Color(hex:"#EFEEDF"))
                        
                        VStack(spacing: 24) {
                            ForEach(policyButtonColor.indices, id: \.self) { index in
                                Button(action: {
                                    if policyButtonColor[index] == Color(hex:"#EFEEDF") {
                                        policyButtonColor[index] = Color(.point)
                                    }
                                    else {
                                        policyButtonColor[index] = Color(hex:"#EFEEDF")
                                    }
                                    if policyButtonColor.allSatisfy({ $0 == Color.point }) {
                                        isAllPolicyButtonsSelected.toggle()
                                    } else {
                                        if isAllPolicyButtonsSelected {
                                            isAllPolicyButtonsSelected.toggle()
                                        }
                                    }
                                }) {
                                    HStack {
                                        Image(.checkCircle)
                                            .renderingMode(.template)
                                        
                                        Text(policyTitle[index])
                                            .font(.pretendard(.number(500), size: 14))
                                        
                                        Spacer()
                                        
                                        Image(.chevronRight)
                                            .renderingMode(.template)
                                    }
                                    .foregroundStyle(policyButtonColor[index])
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 8)
                        
                    }
                }
                .padding(.horizontal, 24)
                
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
                    isSheetPresented.toggle() //TODO: dismiss() 사용시 왜 error?
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
                                .foregroundStyle(isAllPolicyButtonsSelected ? .point : Color(hex:"#525250"))
                        )
                }
                .disabled(isAllPolicyButtonsSelected ? false : true)
                .padding(.horizontal, 16)
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
