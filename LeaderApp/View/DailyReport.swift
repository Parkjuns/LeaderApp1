//
//  DailyReport.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  기타 > 실적입력

import Foundation
import SwiftUI

struct DailyReport : View {
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var writeSuccess : Bool = false
    
    //datepicker
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    static let dateformat: DateFormatter = {
      let formatter = DateFormatter()
       formatter.dateFormat = "YYYY-MM-dd"
       return formatter
    }()
    
    //파라미터로 전달하기위해 포맷
    var formattedReportDate: String {
        return DailyReport.dateformat.string(from: selectedDate)
    }
    
    @StateObject var dailyReportVM : DailyReportVM
    
    @State var prev_day_not_approval: Int = 0 //전일미결
    @State var today_allocation: Int = 0  //당일배당
    @State var today_ending: Int = 0 //당일종결
    @State var today_not_approval: Int = 0 //당일미결
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 3
        return formatter
    }()
    
    var body: some View {
        NavigationView {
          VStack {
              HStack {
                  Button {
                      showDatePicker.toggle()
                  } label: {
                      Text("\(selectedDate, formatter: DailyReportCheck.dateformat)")
                          .font(.title)
                          .bold()
                          .foregroundColor(Color.black)
                  }
              }
                  
              if showDatePicker {
                  DatePicker(
                      "",
                      selection: $selectedDate,
                      in: ...Date(),
                      displayedComponents: [.date]
                  )
                      .datePickerStyle(WheelDatePickerStyle()) // 피커스타일 wheel
                      .labelsHidden() //text 숨김
              }
              HStack {
                Text("전일미결")
                      .foregroundColor(Color.red)
                Spacer()
                  TextField("전일미결",
                            value: $prev_day_not_approval,
                            formatter: Self.formatter,
                            prompt: Text("0"))
                      .fixedSize()
                      .keyboardType(.numberPad)
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
                      .fixedSize()
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
                      .fixedSize()
                      .keyboardType(.numberPad)
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
                      .fixedSize()
                      .keyboardType(.numberPad)

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
                    dailyReportVM.putDailyReport(report_date: "\(formattedReportDate)", prev_day_not_approval: prev_day_not_approval
                                                 , today_allocation: today_allocation, today_ending: today_ending, today_not_approval: today_not_approval)
                } label: {
                  Text("등록")
                }
              }.onReceive(dailyReportVM.writeSuccess) { _ in
                  self.writeSuccess = true
              }.alert("등록되었습니다.", isPresented: $writeSuccess){
                  Button("확인", role: .cancel){
                      self.dismiss()
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
