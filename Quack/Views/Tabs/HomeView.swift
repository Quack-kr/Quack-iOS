//
//  HomeView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var isSheetPresented = false;
    @Binding var selection: Int;
    @State private var currentLocation = "왕십리";
    let locations = CurrentLocation.allCases;
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HomeHeader(isSheetPresented: $isSheetPresented, selection: $selection)
                
                HomeBanner()
                
                HomeRestaurantList()
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
        .sheet(isPresented: $isSheetPresented, content: {
            HomeBottomSheet(currentLocation: $currentLocation, isSheetPresented: $isSheetPresented)
        })
    }
}

#Preview {
    HomeView(selection: .constant(0))
        .background(Color.background)
}
