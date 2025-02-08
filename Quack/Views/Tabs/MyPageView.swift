//
//  MyView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var hackGongGam:Double = 0.2
    
    var body: some View {
        VStack(spacing: 24) {
            MyPageHeader()
            
            MyPageLogin()
            
            MyPageDecibel(hackGongGam: $hackGongGam)
            
            MyPageReview()
            
            MyPageCSCenter()
            
            MyPageEtc()
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MyPageView()
        .background(Color.background)
}
