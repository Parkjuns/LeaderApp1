//
//  DailyReportCheckResponse.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

// MARK: - DailyReportCheckResponse
struct DailyReportCheckResponse: Codable {
    let teamMemberCnt, totalPrevDayNotApproval, totalTodayAllocation, totalTodayEnding: Int
    let totalTodayNotApproval: Int
    let performanceList: [PerformanceList]

    enum CodingKeys: String, CodingKey {
        case teamMemberCnt = "team_member_cnt"
        case totalPrevDayNotApproval = "total_prev_day_not_approval"
        case totalTodayAllocation = "total_today_allocation"
        case totalTodayEnding = "total_today_ending"
        case totalTodayNotApproval = "total_today_not_approval"
        case performanceList = "performance_list"
    }
}

// MARK: - PerformanceList
struct PerformanceList: Codable {
    let userNo: Int
    let userName, userSerial: String
    let teamID: Int
    let teamName: String
    let work, prevDayNotApproval, todayAllocation, todayEnding: Int
    let todayNotApproval: Int
    let approvalYn: ApprovalYn

    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case userName = "user_name"
        case userSerial = "user_serial"
        case teamID = "team_id"
        case teamName = "team_name"
        case work
        case prevDayNotApproval = "prev_day_not_approval"
        case todayAllocation = "today_allocation"
        case todayEnding = "today_ending"
        case todayNotApproval = "today_not_approval"
        case approvalYn = "approval_yn"
    }
}

enum ApprovalYn: String, Codable {
    case n = "N"
}
