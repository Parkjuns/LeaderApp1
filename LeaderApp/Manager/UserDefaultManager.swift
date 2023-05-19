//
//  UserDefaultManager.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/15.
//  토큰저장

import Foundation

class UserDefaultsManager {
    enum Key: String, CaseIterable{
        case token
//        case refreshToken, accessToken
    }
//    var token: String
    
    static let shared: UserDefaultsManager = {
        return UserDefaultsManager()
    }()
    
    // 저장된 모든 데이터 지우기
    func clearAll(){
//        print("UserDefaultsManager - clearAll() called")
//        Key.allCases.forEach{ UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
    
    // 토큰들 저장
    func setTokens(token: String){
        print("UserDefaultsManager - setTokens() called")
        UserDefaults.standard.set(token, forKey: Key.token.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    // 토큰들 가져오기
    func getTokens()->AuthData{
        let token = UserDefaults.standard.string(forKey: Key.token.rawValue) ?? ""
//        let refreshToken = UserDefaults.standard.string(forKey: Key.refreshToken.rawValue) ?? ""
        return AuthData(Authorization: token)
    }

    
}
