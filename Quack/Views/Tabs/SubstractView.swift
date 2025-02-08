//
//  SubstractView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SubstractView: View {
    @State private var isSheetPresented = false;
    @Binding var selection: Int;
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                SubstractHeader(selection: $selection, isSheetPresented: $isSheetPresented)
                
                SubstractBanner()
                
                SubstractRestaurantList()
                
                Spacer()
            }
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    SubstractView(selection: .constant(2))
        .background(Color.background)
}
