//
//  MemberList.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

// MARK: - MemberList
struct MemberList: Codable, Identifiable {
    var id: UUID = UUID()
    let userNo: Int
    let name: String
    let teamID: Int
    let teamName, jobLevel, officeTel: String
    let picturePath: String?
    let hp: String

    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case name
        case teamID = "team_id"
        case teamName = "team_name"
        case jobLevel = "job_level"
        case picturePath = "picture_path"
        case officeTel = "office_tel"
        case hp
    }
}
