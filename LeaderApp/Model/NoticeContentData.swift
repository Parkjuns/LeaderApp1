//
//  NoticeContentData.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

struct NoticeContentData: Codable {
    let memo, subject: String
    let file1, file2, file3, file4, file5: String?
    let hit, memoCnt: Int
    let picturePath: String?
    let regUserName, jobLevel, teamName, regDate: String

    enum CodingKeys: String, CodingKey {
        case memo, subject
        case file1 = "file_1"
        case file2 = "file_2"
        case file3 = "file_3"
        case file4 = "file_4"
        case file5 = "file_5"
        case hit
        case memoCnt = "memo_cnt"
        case regUserName = "reg_user_name"
        case jobLevel = "job_level"
        case teamName = "team_name"
        case picturePath = "picture_path"
        case regDate = "reg_date"
    }
}
