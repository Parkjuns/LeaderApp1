//
//  BoardMemoList.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

struct MemoList: Codable, Identifiable {
    var id: UUID = UUID()
    let no: Int
    let memo, regUserName, jobLevel, teamName: String
    let picturePath: String?
    let regDate: String

    enum CodingKeys: String, CodingKey {
        case no, memo
        case regUserName = "reg_user_name"
        case jobLevel = "job_level"
        case teamName = "team_name"
        case picturePath = "picture_path"
        case regDate = "reg_date"
    }
}
