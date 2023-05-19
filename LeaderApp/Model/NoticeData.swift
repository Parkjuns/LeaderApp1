//
//  NoticeData.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation

// MARK: - NoticeData
struct NoticeData: Codable, Identifiable {
    var id: UUID = UUID()
    var no, work, notice: Int
    var subject: String
    var hit, memoCnt, regUserNo: Int
    var regUserName, jobLevel, teamName, regDate: String

    private enum CodingKeys: String, CodingKey {
        case no, work, notice, subject, hit
        case memoCnt = "memo_cnt"
        case regUserNo = "reg_user_no"
        case regUserName = "reg_user_name"
        case jobLevel = "job_level"
        case teamName = "team_name"
        case regDate = "reg_date"
    }
}

//비교를 위한 Equatable 프로토콜
extension NoticeData : Equatable {
    static func == (lhs: NoticeData, rhs: NoticeData) -> Bool {
        return lhs.id == rhs.id
    }
}
