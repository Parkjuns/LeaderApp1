//
//  DailyReport.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  기타 > 실적입력

import Foundation
import SwiftUI

struct DailyReport : View {
    
    @StateObject var dailyReportVM : DailyReportVM
    
    @State var prev_day_not_approval: Int = 0 //전일미결
    @State var today_allocation: Int = 0  //당일배당
    @State var today_ending: Int = 0 //당일종결
    @State var today_not_approval: Int = 0 //당일미결
    
    static let dateformat: DateFormatter = {
      let formatter = DateFormatter()
       formatter.dateFormat = "YYYY년 M월 d일"
       return formatter
   }()
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView {
          VStack {
              
              Text("\(Date(), formatter: DailyReport.dateformat)")
                  .font(.largeTitle)
              
                  
              HStack {
                Text("전일미결")
                      .foregroundColor(Color.red)
                Spacer()
                  TextField("0", value: $prev_day_not_approval, formatter: Self.formatter)
//                      .fixedSize()
//                      .keyboardType(.numberPad)
                  Text("건")
                      .foregroundColor(Color.gray)
              }
              .padding()
              .frame(maxWidth: 270)
              .border(Color.gray)
              
              HStack {
                Text("당일배당")
                Spacer()
                  TextField("0", value: $today_allocation, formatter: Self.formatter)
//                      .fixedSize()
//                      .keyboardType(.numberPad)
                  Text("건")
                      .foregroundColor(Color.gray)
              }
              .padding()
              .frame(maxWidth: 270)
              .border(Color.gray)
              
              HStack {
                Text("당일종결")
                    .foregroundColor(Color.blue)
                Spacer()
                  TextField("0", value: $today_ending, formatter: Self.formatter)
//                      .fixedSize()
//                      .keyboardType(.numberPad)
                  Text("건")
                    .foregroundColor(Color.gray)
              }
              .padding()
              .frame(maxWidth: 270)
              .border(Color.gray)
              
              HStack {
                Text("당일미결")
                    .foregroundColor(Color.red)
                Spacer()
                TextField("0", value: $today_not_approval, formatter: Self.formatter)
                Text("건")
                      .foregroundColor(Color.gray)
              }
              .padding()
              .frame(maxWidth: 270)
              .border(Color.gray)
          }
              .navigationBarTitle("실적입력", displayMode: .inline)
              .toolbar {
                Button {
                  print("실적입력클릭!")
                    dailyReportVM.putDailyReport(report_date: "2023-05-19", prev_day_not_approval: prev_day_not_approval
                                                 , today_allocation: today_allocation, today_ending: today_ending, today_not_approval: today_not_approval)
                } label: {
                  Text("등록")
                }
              }
        }
    }//body

}

//struct DailyReport_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyReport()
//    }
//}
