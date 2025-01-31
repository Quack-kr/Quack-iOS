//
//  AlarmView.swift
//  Quack
//
//  Created by 차차 on 1/30/25.
//

import SwiftUI

struct AlarmView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var isNoticeRemained = true;
    @State private var alarms = ["", "checked", ""];
    @State private var isRoot = true;
//    @State private var alarmPath = NavigationPath()
    
    var body: some View {
            ZStack {
                VStack {
                    HStack {
                        HStack {
                            Button(action: {
                                if true {
//                                if alarmPath.isEmpty {
                                    // TODO: TabBarView로 이동
                                    coordinator.pop()
                                } else {
                                    //alarmPath.removeLast()
                                    
                                    withAnimation {
                                        isRoot.toggle()
                                    }
                                }
                                
                            }) {
                                Image(.chevronLeft)
                            }
                            
                            Text("알림")
                                .font(.theJamsil(.number(700), size: 20))
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                        }
                        .padding(.vertical, 4)
                        
                        Spacer()
                        
                        if isNoticeRemained && isRoot {
                            Button(action: {
                                alarms.removeAll()
                            }) {
                                Text("전체 삭제")
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                    .font(.pretendard(.number(600), size: 12))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(Color(hex:"#2A2925"))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    if isNoticeRemained {
                        //NavigationStack(path: $alarmPath) {
                            
                            ZStack {
                                Color.background
                                
                                List {
                                    ForEach(alarms,id: \.self) { alarm in
                                        
                                        Button(action: {
                                                isRoot.toggle()

//                                            alarmPath.append(alarm)
                                        }) {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 8) {
                                                    Text("[이벤트] 꽥이 소개하는 찐 맛집!!")
                                                        .font(.pretendard(.number(800), size: 14))
                                                        .foregroundStyle(Color(hex:"#EFEEDF"))
                                                    
                                                    Text("1시간 전")
                                                        .font(.pretendard(.number(500), size: 14))
                                                        .foregroundStyle(Color(hex:"#A8A7A1"))
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 14)
                                            .background(alarm == "checked" ? Color(hex:"#21211D") : Color(hex:"#323230"))
                                            // TODO: 색상 조건 변경하기
                                        }
                                        .labelsHidden()
                                    }
                                    .onDelete(perform: delete)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets())
                                }
                                .listRowSpacing(16)
                                .scrollContentBackground(.hidden)
                                .navigationDestination(for: String.self, destination: { alarm in
                                    ZStack {
                                        Color.background
                                        
                                        AlarmContentView(isRoot: $isRoot, alarm: alarm)
                                            .navigationBarBackButtonHidden()
                                    }
                                })
                            }
                        //}
                    }
                    
                    Spacer()
                }
                
                if !isNoticeRemained {
                    VStack {
                        Spacer()
                        
                        Text("수신받은 알람이 없어요.")
                            .font(.theJamsil(.number(700), size: 16))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                        Spacer()
                    }
                }
            }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
          alarms.remove(at: first)
        }
      }
}

#Preview {
    AlarmView()
        .background(Color.background)
}
