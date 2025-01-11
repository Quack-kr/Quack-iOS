//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI

import SwiftUI

struct InitialView: View {
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
    }
}

#Preview {
    InitialView()
        .background(Color.background)
}
