//
//  HomeViewHeader.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var isSheetPresented: Bool
    @Binding var selection: Int
    @EnvironmentObject private var coordinator: Coordinator<Destination>

    var body: some View {
        HStack {
            Image(.logo)
                .frame(height: 35)
            
            Button(action: {
                isSheetPresented.toggle()
            }) {
                HStack {
                    Text("동네설정")
                        .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                    
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
    }
}

#Preview {
    HomeHeader(isSheetPresented: .constant(false), selection: .constant(1))
}
