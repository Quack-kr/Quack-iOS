//
//  SearchResultView.swift
//  Quack
//
//  Created by 차차 on 2/23/25.
//

import SwiftUI

struct SearchResultView: View {
    @State private var isSheetPresented = false
    @State private var selectedIndex = 0

    var body: some View {
        VStack {
            HStack {
                Button(action: {

                }, label: {
                    Text("영업중")
                        .textModifier(.theJamsil, 700, 12, "#A8A7A1")
                })
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color(hex: "#2A2925"))
                )

                HStack {
                    Button(action: {
                        isSheetPresented.toggle()
                    }, label: {
                        HStack(spacing: 4) {
                            Text(buttonText[selectedIndex])

                            Image(.chevronDown)
                        }
                        .textModifier(.theJamsil, 700, 12, "#EFEEDF")
                        .foregroundStyle(Color(hex: "#EFEEDF"))

                    })
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color(hex: "#2A2925"))
                    )

                    Spacer()
                }

            }

            Spliter()
            
            ForEach(0 ..< 10) { _ in
                // TODO: Live Ranking Block protocol로 변경 후 SearchedRestaurantBlock 구현
            }   
            VStack {

            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
            SearchedResultBottomSheet(selectedIndex: $selectedIndex, isSheetPresented: $isSheetPresented)
        })
    }
}

#Preview {
    SearchResultView()
        .background(Color(hex: "#171714"))
}
