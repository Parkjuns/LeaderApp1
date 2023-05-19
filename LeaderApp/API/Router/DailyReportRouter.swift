//
//  DailyReportRouter.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import Alamofire

enum DailyReportRouter: URLRequestConvertible {
    
    case putDailyReport(report_date:String, prev_day_not_approval:Int, today_allocation:Int, today_ending:Int, today_not_approval:Int)
    case getDailyReport(report_date:String, work:Int, team_id:Int)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .putDailyReport:
            return "api/daily_report/performance"
        case .getDailyReport(let report_date, let work, let team_id):
            return "/api/daily_report/report_date/\(report_date)/work/\(work)/team/\(team_id)"
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .putDailyReport :
            return .put
        case .getDailyReport :
            return .get
        }
    }
    
    
    typealias EmptyParameters = [String: Any]
    var parameters: Parameters {
        switch self {
        case let .putDailyReport(report_date, prev_day_not_approval, today_allocation, today_ending, today_not_approval):
            var params = Parameters()
            params["report_date"] = report_date
            params["prev_day_not_approval"] = prev_day_not_approval
            params["today_allocation"] = today_allocation
            params["today_ending"] = today_ending
            params["today_not_approval"] = today_not_approval
            return params
        default:
            return EmptyParameters()
        }
    }
    
    //최종 URLRequest
    func asURLRequest() throws -> URLRequest {
//        let url = baseURL.appendingPathComponent(endPoint)
//        var request = URLRequest(url: url)
//        request.method = method
//        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
//        return request
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        print("asURLRequest - request : \(request)")
        
        // HTTP GET 요청에서는 httpBody를 설정하지 않도록 처리
        //.httpBody: POST 전송에서 사용되는 HTTP Body 방식으로 인코딩
        if method != .get {
            request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        }
        print("request == \(request.debugDescription)")
        
        return request
    }
    
}
