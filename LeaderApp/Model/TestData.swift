//
//  TestData.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/19.
//

import Foundation

struct TestData: Codable {
    var teamMemberCnt, totalPrevDayNotApproval, totalTodayAllocation, totalTodayEnding: Int
    let totalTodayNotApproval: Int

    enum CodingKeys: String, CodingKey {
        case teamMemberCnt = "team_member_cnt"
        case totalPrevDayNotApproval = "total_prev_day_not_approval"
        case totalTodayAllocation = "total_today_allocation"
        case totalTodayEnding = "total_today_ending"
        case totalTodayNotApproval = "total_today_not_approval"
    }
}
