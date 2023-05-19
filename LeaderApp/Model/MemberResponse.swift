//
//  MemberResponse.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

// MARK: - MemberResponse
struct MemberResponse: Codable {
    let memberList: [MemberList]

    enum CodingKeys: String, CodingKey {
        case memberList = "member_list"
    }
}
