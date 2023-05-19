//
//  BoardListResponse.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
//{
//  "total_cnt": 3093,
//  "notice_list": [
//    {
//      "no": 3093,
//      "work": 0,
//      "notice": 0,
//      "subject": "개인정보보호 및 법률위반행위 관련 당부",
//      "hit": 3,
//      "memo_cnt": 0,
//      "reg_user_no": 399,
//      "reg_user_name": "유호진",
//      "job_level": "4종 이사",
//      "team_name": "임원",
//      "reg_date": "2023-03-30T10:18:05"
//    }
//  ]
//}
// MARK: - BoardListResponse
struct BoardListResponse: Codable {
    let totalCnt: Int
    let currentPage: Int
    let noticeList: [NoticeData]

    enum CodingKeys: String, CodingKey {
        case totalCnt = "total_cnt"
        case currentPage = "current_page"
        case noticeList = "notice_list"
    }
}
