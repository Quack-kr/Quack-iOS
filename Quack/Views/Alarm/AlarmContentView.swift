//
//  AlarmContentView.swift
//  Quack
//
//  Created by 차차 on 1/30/25.
//

import SwiftUI

struct AlarmContentView: View {
    @Binding var isRoot: Bool
    var alarm: String // TODO: Change Data Type
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8){
                Text("[이벤트] 꽥이 소개하는 찐 맛집!!")
                    .font(.pretendard(.number(800), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                Text("2024.10.04")
                    .font(.pretendard(.number(500), size: 14))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
            }
            
            Divider()
                .background(Color(hex:"#68675E"))
            
            Image(.dummyThumbnail)
                .resizable()
                .scaledToFit()
            
            Text("""
                모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다
                이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다. 모든 국민은 주거의 자유를 침해받지 아니한다. 주거에 대한 압수나 수색을 할 때에는 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다.
                국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다.
                """)
            .font(.pretendard(.number(500), size: 12))
            .foregroundStyle(Color(hex:"#EFEEDF"))
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AlarmContentView(isRoot: .constant(false), alarm: "")
        .background(Color.background)
}
