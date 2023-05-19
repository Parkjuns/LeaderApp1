//
//  EmployeeService.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import Combine
import Alamofire

enum EmployeeApiService {
    
    //직원명부(팀정보)
    static func teamList() -> AnyPublisher<([TeamList]), AFError> {
        print("EmployeeApiService - teamList() START!")
        
        // 토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(EmployeeRouter.teamList, interceptor: authInterceptor)
            .publishDecodable(type: EmployeeResponse.self)
            .value()
            .map { response in
                return response.teamList
            }
            .eraseToAnyPublisher()
    }
    
    //팀 리스트 > 팀원 정보
    static func teamEmployeeList(team_id: Int) -> AnyPublisher<([MemberList]), AFError> {
        print("EmployeeApiService - fetchTeam() START!")
        
        // 토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(EmployeeRouter.teamEmployeeList(team_id: team_id), interceptor: authInterceptor)
            .publishDecodable(type: MemberResponse.self)
            .value()
            .map { response in
                return response.memberList
            }
            .eraseToAnyPublisher()
    }
}
