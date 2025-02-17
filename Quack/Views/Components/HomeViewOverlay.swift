//
//  MVPoverlay.swift
//  Quack
//
//  Created by 차차 on 2/10/25.
//

import SwiftUI

struct HomeViewOverlay: View {
    @Binding var selection: Int
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.logo)
                    .frame(height: 35)
                
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
            
            Spacer()
            
            VStack {
                
                Image(.making)
                
                Text("뚝딱뚝딱 만들고 있어요!")
                    .textModifier(.theJamsil, 700, 16, "#A8A7A1")
                
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.background)
    }
}

#Preview {
    HomeViewOverlay(selection: .constant(0))
}
