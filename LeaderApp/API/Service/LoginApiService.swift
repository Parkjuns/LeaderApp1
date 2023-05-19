//
//  LoginApiService.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/15.
//  로그인 관련 api 호출

import Foundation
import Alamofire
import Combine
import JWTDecode

enum LoginApiService {
    
    //로그인
    //json타입을 바로 converting해서 받을수있음(anypublisher (combine))
    static func login(user_serial: String, pw: String) -> AnyPublisher<AuthData, AFError> {
        print("AuthApiService - login")
        
        return ApiClient.shared.session
            .request(LoginRouter.login(user_serial: user_serial, pw: pw))
            .publishDecodable(type: AuthData.self)
            .value()
            .map { receivedValue in
                //토큰저장
                let token_original = receivedValue.Authorization.components(separatedBy: " ")
                UserDefaultsManager.shared.setTokens(token: token_original[1])
            
                return receivedValue.self
            }.eraseToAnyPublisher()
    }
    
    
    //로그인 후 정보저장
    static func minfo(device: String, os: String, os_version: String, app_version: String) -> AnyPublisher<MinfoResponse, AFError> {
        print("AuthApiService - minfo start")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        do{
            let jwt = try decode(jwt: "\(credential.token)")
        }catch{
            print("error reading docs")
        }
        
        return ApiClient.shared.session //ApiClient.shared.session에 접근
            .request(LoginRouter.minfo(device: device, os: os, os_version: os_version, app_version: app_version), interceptor: authInterceptor) //minfo api호출. 이때 인터셉터를 이용해 인증정보를 추가한다.
            .publishDecodable(type: MinfoResponse.self) //userinfo 타입으로 디코딩
            .value() //디코딩 된 값 가져오기
            .map { receivedValue in //map을 이용해 receivedvalue 객체 그대로 반환
                return receivedValue.self
            }
            .eraseToAnyPublisher()
    }
    
    //로그인+정보저장
    static func loginAndminfo(user_serial: String, pw: String, device: String, os: String, os_version: String, app_version: String) -> AnyPublisher<MinfoResponse, AFError> {
        
        return LoginApiService.login(user_serial: user_serial, pw: pw)
            .flatMap { userData in
                LoginApiService.minfo(device: device, os: os, os_version: os_version, app_version: app_version)
            }
            .eraseToAnyPublisher()
    }
}
