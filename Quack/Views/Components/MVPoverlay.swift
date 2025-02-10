//
//  MVPoverlay.swift
//  Quack
//
//  Created by 차차 on 2/10/25.
//

import SwiftUI

struct MVPoverlay: View {
    let selection: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text("홈")
            
            Spacer()
            
            Image(.making)
            
            Text("뚝딱뚝딱 만들고 있어요!")
                .textModifier(.theJamsil, 700, 16, "#A8A7A1")
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
    }
}

#Preview {
    MVPoverlay(selection: 0)
}
