//
//  Constants.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation
import SwiftUI

/** InitialVIew */
let PolicyTitle = [
    "서비스 이용약관 동의 (필수)",
    "개인정보 수집 및 이용 동의 (필수)",
    "위치정보 서비스 이용약관 동의 (필수)",
    "마케팅 정보 활용 동의 (선택)"
]

let PolicyNotice = """
                     \'선택\' 항목에 동의하지 않아도 서비스 이용이 가능합니다.
                     개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며,
                     동의 거부시 서비스 이용이 제한됩니다.
                     """

let KakaoAppKey = Bundle.main.infoDictionary?["KakaoAppKey"] as! String

let TASTE = ["미친 맛", "맛있어요", "평범해요", "아쉬워요", "핵노맛"]

let SubstractBannerTitle = """
                            싫어하는 걸
                            싹 빼고
                            시작하자.
                            """
let SubstractBannerSubtitle = """
                                꽥은 당신이
                                뭘 먹고 싶은지
                                묻지 않아요
                                """
let DummyAlarmContent = """
                            모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다
                            이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다. 모든 국민은 주거의 자유를 침해받지 아니한다. 주거에 대한 압수나 수색을 할 때에는 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다.
                            국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다.
                        """
