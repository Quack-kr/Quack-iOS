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
            VStack(spacing:0) {
                SubstractHeader(selection: $selection, isSheetPresented: $isSheetPresented)
                
                Spliter()
                
                SubstractBanner()
                
                Spliter()
                
                SubstractRestaurantList()
            }
            
            Spacer()
        }
    }
}

#Preview {
    SubstractView(selection: .constant(2))
        .background(Color(hex:"#171714"))
}
