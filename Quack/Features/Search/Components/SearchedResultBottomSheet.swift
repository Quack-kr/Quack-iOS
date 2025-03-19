//
//  SearchedResultBottomSheet.swift
//  Quack
//
//  Created by 차차 on 2/23/25.
//

import SwiftUI

struct SearchedResultBottomSheet: View {
    @Binding var selectedIndex: Int
    @Binding var isSheetPresented: Bool

    var body: some View {
        VStack(spacing: 24) {
            // TODO: sheet close 기능 구현하기 -> 현재 전체 화면에 다 적용되어 있음
            Capsule()
                .foregroundStyle(Color(hex: "#EFEEDF"))
                .frame(width: 40, height: 4)
                .padding(.top, 16)

            ForEach(0 ..< 3) { ind in
                Button(action: {
                    selectedIndex = ind
                    isSheetPresented.toggle()
                }, label: {
                    HStack {
                        Text(buttonText[ind])
                            .textModifier(.theJamsil, 700, 18, "#EFEEDF")

                        Spacer()

                        if selectedIndex == ind {
                            Image(.check)
                        }
                    }
                })
            }
            .padding(.horizontal, 24)

        }
        .frame(maxWidth: .infinity)
        .presentationDetents([.fraction(0.24)])
        .presentationBackground(Color(hex: "#323230"))
    }
}

#Preview {
    struct Preview: View {
        @State var ind = 1
        
        var body: some View {
            SearchedResultBottomSheet(selectedIndex: $ind, isSheetPresented: .constant(false))
                .background(Color(hex: "#323230"))
        }
    }
    
    return Preview()
}
