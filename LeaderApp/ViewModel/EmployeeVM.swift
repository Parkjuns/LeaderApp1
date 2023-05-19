//
//  EmployeeVM.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import Alamofire
import Combine


class EmployeeVM: ObservableObject {
    var subscription = Set<AnyCancellable>() //메모리 정리 위해
    
    @Published var teams : [TeamList] = [] //팀 리스트
    @Published var memberList : [MemberList] = [] //팀원 리스트
    
    //팀 리스트
    func teamList(){
        print("EmployeeVM: teamList() called")
        EmployeeApiService.teamList()
            .sink { (completion: Subscribers.Completion<AFError>) in //sink메서드를 사용하여 AuthApiService.login의 결과값을 받는다
                print("EmployeeVM completion: \(completion)")
                
            } receiveValue: { (receivedUser: [TeamList]) in //받은값
                print("EmployeeVM completion: \(receivedUser)")
                self.teams = receivedUser
                
            }.store(in: &subscription) //메모리 정리 위해
    }
    
    //팀 리스트 > 팀원 정보
    func teamEmployeeList(team_id: Int){
        print("EmployeeVM: teamEmployeeList() called")
        EmployeeApiService.teamEmployeeList(team_id: team_id)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("EmployeeVM completion: \(completion)")
                
            } receiveValue: { (receivedUser: [MemberList]) in
                print("EmployeeVM completion: \(receivedUser)")
                self.memberList = receivedUser

            }.store(in: &subscription) //메모리 정리 위해
    }
}
