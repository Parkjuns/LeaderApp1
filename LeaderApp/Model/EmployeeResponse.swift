//
//  EmployeeResponse.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation

// MARK: - EmployeeResponse
struct EmployeeResponse: Codable {
    let teamList: [TeamList]

    enum CodingKeys: String, CodingKey {
        case teamList = "team_list"
    }
}
