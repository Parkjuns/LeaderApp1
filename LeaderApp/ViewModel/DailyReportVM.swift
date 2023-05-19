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
    
    //일일보고 > 실적입력
    func putDailyReport(report_date:String, prev_day_not_approval:Int, today_allocation:Int, today_ending:Int, today_not_approval:Int){
        print("DailyReportVM - 일일보고 > 실적입력")
        
        DailyReportService.putDailyReport(report_date: report_date,
                                          prev_day_not_approval: prev_day_not_approval,
                                          today_allocation: today_allocation,
                                          today_ending: today_ending,
                                          today_not_approval: today_not_approval)
        
        .sink { (completion: Subscribers.Completion<AFError>) in
            print("DailyReportVM completion: \(completion.self)")
            
        } receiveValue: {
            print("value \($0)")
        }.store(in: &subscription) //메모리 정리 위해
    }
    
}
