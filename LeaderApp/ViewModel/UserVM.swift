//
//  UserVM.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject { //변경을 감지 - ObservableObject
    
    var subscription = Set<AnyCancellable>() //메모리 정리 위해
    
    @Published var loggedInUser: AuthData? = nil //로그인 한 후 값 변경이 일어남
    @Published var minfo: MinfoResponse? = nil
    
    //로그인 완료 이벤트
    var loginSuccess = PassthroughSubject<(), Never>()
    
    // 로그인 하기
    // 클로저를 인자로 전달하여, 인증결과값을 받을 수 있다.
    func login(user_serial: String, pw: String){
        print("UserVM: login() called")
        LoginApiService.login(user_serial: user_serial, pw: pw)

            .sink { (completion: Subscribers.Completion<AFError>) in //sink메서드를 사용하여 AuthApiService.login의 결과값을 받는다
                print("UserVM completion: \(completion)")
                
            } receiveValue: { (receivedUser: AuthData) in //받은값
                print("UserVM - login() receivedUser \(receivedUser)")
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription) //메모리 정리 위해
    }
    
    //로그인 후 정보저장
    func minfo(device: String, os: String, os_version: String, app_version: String){
        print("UserInfoVM: minfo() called \(app_version)")
        LoginApiService.minfo(device: device, os: os, os_version: os_version, app_version: app_version)
        
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
                
            } receiveValue: { (receivedUser: MinfoResponse) in //받은값
                print("UserVM - minfo() receivedUser \(receivedUser)")
                self.minfo = receivedUser
            }.store(in: &subscription) //메모리 정리 위해
    }
    
    //로그인+정보저장
    func loginAndminfo(user_serial: String, pw: String, device: String, os: String, os_version: String, app_version: String){
        print("UserInfoVM: loginAndminfo() called")
        LoginApiService.loginAndminfo(user_serial: user_serial,
                                     pw: pw,
                                     device: device,
                                     os: os,
                                     os_version: os_version,
                                     app_version: app_version)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
                
            } receiveValue : { (receivedUser : MinfoResponse) in
                print("AuthApiService - loginAndminfo - userInfo \(receivedUser)")
                self.loginSuccess.send() //로그인 성공시 화면 변경 위해
            }.store(in: &subscription)
    }
}
