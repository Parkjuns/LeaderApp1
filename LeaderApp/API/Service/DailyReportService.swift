//
//  DailyReportService.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  일일보고

import Foundation
import Combine
import Alamofire

enum DailyReportService {
    
    //일일보고 > 실적입력
    static func putDailyReport(report_date: String, prev_day_not_approval: Int, today_allocation: Int, today_ending: Int, today_not_approval: Int) -> AnyPublisher<MessageData, AFError> {
        print("DailyReportService 시작")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session //ApiClient.shared.session에 접근
            .request(DailyReportRouter.putDailyReport(report_date: report_date,
                                                      prev_day_not_approval: prev_day_not_approval,
                                                      today_allocation: today_allocation,
                                                      today_ending: today_ending,
                                                      today_not_approval: today_not_approval), interceptor: authInterceptor)
            .publishDecodable(type: MessageData.self)
            .value()
            .map{ $0.self }
            .eraseToAnyPublisher()
    }
    
    //팀별 일일배당확인
    static func getDailyReport(report_date:String, work:Int, team_id:Int) -> AnyPublisher<(DailyReportCheckResponse), AFError> {

        print("getDailyReport 시작")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)

        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(DailyReportRouter.getDailyReport(report_date: report_date, work: work, team_id: team_id), interceptor: authInterceptor)
            .publishDecodable(type: DailyReportCheckResponse.self)
            .value()
            .map { response in
                print("받은값 :: \(response)")
                return response
            }
            .eraseToAnyPublisher()
    }
}
