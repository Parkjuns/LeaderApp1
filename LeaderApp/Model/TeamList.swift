//
//  TeamList.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

// MARK: - TeamList
struct TeamList: Codable, Identifiable {
    var id: UUID = UUID()
    var teamID, work: Int
    var teamName, teamTell, teamAddr, workName: String
    var ancestorName: String
    var memberCnt: Int

    private enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case work
        case teamName = "team_name"
        case teamTell = "team_tell"
        case teamAddr = "team_addr"
        case workName = "work_name"
        case ancestorName = "ancestor_name"
        case memberCnt = "member_cnt"
    }
}
