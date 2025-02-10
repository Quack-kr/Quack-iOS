//
//  HomeBottomSheet.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct HomeBottomSheet: View {
    @Binding var currentLocation : String
    @Binding var isSheetPresented: Bool
    let locations = CurrentLocation.allCases;
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundStyle(Color(hex:"#EFEEDF"))
                .frame(width: 40, height: 4)
                .padding(.top, 16)
                .padding(.bottom, 24)
            
            HStack {
                Text("동네 설정")
                    .textModifier(.theJamsil, 700, CGFloat(18), "#EFEEDF")
                
                Spacer()
                
                Text("현재위치로 설정: \(currentLocation)")
                    .textModifier(.pretendard, 600, CGFloat(14), .point)
            }
            
            Divider()
                .background(Color(hex: "#68675E"))
                .padding(.bottom, 24)
            
            Grid(alignment: .leading, horizontalSpacing: 50, verticalSpacing: 32) {
                ForEach(0 ..< 6) { row in
                    if (row > 0 && row < 4) {
                        GridRow {
                            ForEach(0  ..< 4) { col in
                                Button(action: { currentLocation = locations[row * 3 + row - 1 + col].rawValue; }) {
                                    Text(locations[row * 3 + row - 1 + col].rawValue)
                                            .font(currentLocation == locations[row * 3 + row - 1 + col].rawValue ? .pretendard(.number(700), size: 18) : .pretendard(.number(500), size: 15))
                                            .foregroundStyle(currentLocation == locations[row * 3 + row - 1 + col].rawValue ? Color(hex:"#EFEEDF") : Color(hex:"#68675E"))
                                }
                            }
                        }
                        
                    }
                    else {
                        let rowNum = row == 0 ? 0 : 3;
                        
                        GridRow {
                            ForEach(0 ..< 3) { col in
                                Button(action: { currentLocation = locations[row * 3 + rowNum + col].rawValue; } ) {
                                    Text(locations[row * 3 + rowNum + col].rawValue)
                                        .font(currentLocation == locations[row * 3 + rowNum + col].rawValue ? .pretendard(.number(700), size: 18) : .pretendard(.number(500), size: 15))
                                        .foregroundStyle(currentLocation == locations[row * 3 + rowNum + col].rawValue ? Color(hex:"#EFEEDF") : Color(hex:"#68675E"))
                                }
                            }
                        }

                    }

                }
            }
            
            Spacer()
            
            Button(action: { isSheetPresented.toggle() }) {
                Text("설정완료")
                    .pointColorButtonTextModifier()
            }
        }
        .padding(.horizontal, 24)
        .presentationDetents([.fraction(0.75)])
        .presentationBackground(Color(hex:"#323230"))
    }
}

#Preview {
    HomeBottomSheet(currentLocation: .constant("왕십리"), isSheetPresented: .constant(false))
}
