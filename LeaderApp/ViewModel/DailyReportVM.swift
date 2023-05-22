//
//  DailyReportVM.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  일일보고

import Foundation
import Alamofire
import Combine

class DailyReportVM: ObservableObject {
    var subscription = Set<AnyCancellable>() //메모리 정리 위해
    
    //등록 이벤트
    @Published var writeSuccess = PassthroughSubject<(), Never>()
    
    //일일배당 확인
    @Published var performanceList : [PerformanceList] = []
    @Published var teamMemberCnt : Int = 0
    @Published var totalPrevDayNotApproval : Int = 0
    @Published var totalTodayAllocation : Int = 0
    @Published var totalTodayEnding : Int = 0
    @Published var totalTodayNotApproval : Int = 0
    
//    @Published var testData : TestData = TestData()
    
    
    //일일보고 > 실적입력
    func putDailyReport(report_date: String, prev_day_not_approval: Int, today_allocation: Int, today_ending: Int, today_not_approval: Int){
        print("DailyReportVM 시작")
        
        DailyReportService.putDailyReport(report_date: report_date,
                                          prev_day_not_approval: prev_day_not_approval,
                                          today_allocation: today_allocation,
                                          today_ending: today_ending,
                                          today_not_approval: today_not_approval)

        .sink { (completion: Subscribers.Completion<AFError>) in
            print("DailyReportVM completion: \(completion)")
            
        } receiveValue: { MessageData in
            print(MessageData)
        }.store(in: &subscription) //메모리 정리 위해
        
        
    }
    
    //기타 > 팀별 일일배당 확인
    func getDailyReport(report_date: String, work: Int, team_id: Int){
        print("DailyReportVM 시작")
        DailyReportService.getDailyReport(report_date: report_date, work: work, team_id: team_id)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("DailyReportVM completion: \(completion)")
            } receiveValue: { receivedData in
                self.performanceList = receivedData.performanceList
                self.teamMemberCnt = receivedData.teamMemberCnt
                self.totalPrevDayNotApproval = receivedData.totalPrevDayNotApproval
                self.totalTodayAllocation = receivedData.totalTodayAllocation
                self.totalTodayEnding = receivedData.totalTodayEnding
                self.totalTodayNotApproval = receivedData.totalPrevDayNotApproval
                print("========performanceList===\(self.performanceList)")
            }.store(in: &subscription)
    }
    
}
