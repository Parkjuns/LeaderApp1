//
//  EmployeeRouter.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import Alamofire

enum EmployeeRouter: URLRequestConvertible {
    
    case teamList
    case teamEmployeeList(team_id: Int)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .teamList:
            return "employee/team"
        case .teamEmployeeList(let team_id):
            return "employee/team/\(team_id)"
//        default:
//            return ""
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .teamList:
            return .get
        case .teamEmployeeList:
            return .get
//        default: return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
//        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        return request
    }

}
