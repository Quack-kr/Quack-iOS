//
//  AlarmView.swift
//  Quack
//
//  Created by 차차 on 1/30/25.
//

import SwiftUI

struct AlarmView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @State private var alarms: [Alarm] = [Alarm(title: "[이벤트] 꽥이 소개하는 찐 맛집!!", date: Date(), content: "", img: "", isChecked: true), Alarm(title: "", date: Date(), content: "", img: "")]
    @State private var isRoot = true

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HStack {
                        Button(action: {
                            if true {
                                coordinator.pop()
                            } else {
                                withAnimation {
                                    isRoot.toggle()
                                }
                            }

                        }, label: {
                            Image(.chevronLeft)
                        })

                        Text("알림")
                            .font(.theJamsil(.number(700), size: 20))
                            .foregroundStyle(Color(hex: "#EFEEDF"))
                    }
                    .padding(.vertical, 4)

                    Spacer()

                    if !alarms.isEmpty && isRoot {
                        Button(action: {
                            alarms.removeAll()
                        }, label: {
                            Text("전체 삭제")
                                .foregroundStyle(Color(hex: "#EFEEDF"))
                                .font(.pretendard(.number(600), size: 12))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(Color(hex: "#2A2925"))
                                )
                        })
                    }
                }
                .padding(.horizontal, 16)

                if !alarms.isEmpty {
                    ZStack {
                        Color.background

                        List {
                            ForEach(alarms, id: \.self) { alarm in

                                Button(action: {
                                    isRoot.toggle()
                                }, label: {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text(alarm.title)
                                                .font(.pretendard(.number(800), size: 14))
                                                .foregroundStyle(Color(hex: "#EFEEDF"))

                                            Text(alarm.getTime())
                                                .font(.pretendard(.number(500), size: 14))
                                                .foregroundStyle(Color(hex: "#A8A7A1"))
                                        }

                                        Spacer()
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 14)
                                    .background(alarm.isChecked ? Color(hex: "#21211D") : Color(hex: "#323230"))
                                    // FIXME: 색상 조건 변경하기
                                })
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
                    // }
                }

                Spacer()
            }

            if alarms.isEmpty {
                VStack {
                    Spacer()

                    Text("수신받은 알람이 없어요.")
                        .font(.theJamsil(.number(700), size: 16))
                        .foregroundStyle(Color(hex: "#A8A7A1"))

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
