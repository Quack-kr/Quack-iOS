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
            
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                }){
                    // TODO: 카카오 로그인 이미지로 넣기
                    ZStack {
                        Rectangle()
                            .frame(width: 343, height: 53)
                            .cornerRadius(8)
                    }
                }
                
                Button(action: {
                    
                }){
                    Rectangle()
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundStyle(.white)
                    
                }
                
                Button(action: {
                    
                }){
                    Rectangle()
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundStyle(.white)
                }
                
                NavigationLink("둘러보기", destination: SignUpView())
                    .foregroundStyle(.gray)
            }
        }
        .padding(.top,200)
        .padding(.bottom, 50)
        .sheet(isPresented: $isSheetPresented, onDismiss: didDismiss, content: {
            VStack {
                Spacer()
                
                Text("약관동의")
                    .padding(.bottom, 16)
                
                VStack() {
                    Button(action: {}) {
                        HStack {
                            // TODO: 체크 이미지 넣기
                            Image(systemName: "checkmark.circle")

                            Text("이용약관 모두 동의")
                            
                            Spacer()
                        }
                        .padding(.leading, 10)
                        .padding(.vertical, 10)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 110)
                                        .stroke(Color.black, lineWidth: 1) //TODO: stroke 색상 변경
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    VStack(spacing: 24) {
                        HStack {
                            // TODO: 체크이미지 추가
                            Image(systemName: "checkmark.circle")
                            
                            Text("서비스 이용약관 동의 (필수)")
                            
                            Spacer()
                            
                            // TODO: 화살표 이미지 넣기
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle")
                            
                            Text("개인정보 수집 및 이용 동의 (필수)")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle")
                            
                            Text("위치정보 서비스 이용약관 동의 (필수)")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle")
                            
                            Text("마케팅 정보 활용 동의 (선택)")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
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
            .presentationDetents([.medium]) // TODO: 높이 설정해주기
//            .presentationBackground(.)
        })
    }
    
    func didDismiss() {}
}

#Preview {
    InitialView()
        .background(Color.background)
}
