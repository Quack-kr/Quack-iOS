//
//  SubstractHeader.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct SubstractHeader: View {
    @Binding var selection: Int
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 24) {
                /** Substract Header */
                HStack(spacing: 16) {
                    Text("뺴기")
                        .textModifier(.theJamsil, 700, 20, "#EFEEDF")
                    
                    Spacer()
                    
                    Button(action:{ selection = 1; }){
                        Image(.search)
                    }
                    
                    Button(action:{}){
                        Image(.notify)
                    }
                }
                .padding(.horizontal, 16)
                
                /** Substract  Filter  */
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isSheetPresented.toggle()
                        }) {
                            HStack {
                                Text("동네설정")
                                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                                
                                Image(.chevronDown)
                                    .frame(height: 12)
                            }
                            .substractViewButtonModifier(10)
                        }
                        
                        HStack(spacing: 8) {
                            Button(action: {}) {
                                Image(.menu)
                                    .frame(height: 19)
                                    .substractViewButtonModifier(10)
                            }
                            
                            Button(action: {}) {
                                Text("메뉴")
                                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                                    .substractViewButtonModifier(10)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.vertical, 9)
                .padding(.leading, 16)
            }
            .background(
                Rectangle()
                    .foregroundStyle(Color(hex:"#171714"))
            )
        }
    }
}

#Preview {
    SubstractHeader(selection: .constant(2), isSheetPresented: .constant(false))
}
