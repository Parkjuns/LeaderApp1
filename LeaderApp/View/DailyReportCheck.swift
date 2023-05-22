//
//  DailyReportCheck.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  실적입력확인

import Foundation
import SwiftUI

struct DailyReportCheck : View {
    
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    //파라미터로 전달하기위해 포맷
    var formattedReportDate: String {
        return DailyReport.dateformat.string(from: selectedDate)
    }
    
    @EnvironmentObject var dailyReportVM : DailyReportVM
    
    //데이터 가져오기
    @State var performanceList : [PerformanceList] = []
    @State var teamMemberCnt : Int = 0
    @State var totalPrevDayNotApproval : Int = 0
    @State var totalTodayAllocation : Int = 0
    @State var totalTodayEnding : Int = 0
    @State var totalTodayNotApproval : Int = 0
    
    static let dateformat: DateFormatter = {
      let formatter = DateFormatter()
       formatter.dateFormat = "YYYY년 MM월 dd일"
       return formatter
    }()
    
    //리스트 고정헤더
    func headerView() -> some View{
        HStack{
            Text("전체 \(teamMemberCnt)건")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
            Spacer()
            VStack(alignment: .trailing){
                HStack{
                    Text("전일미결")
                        .font(.system(size:11))
                    Text("\(totalPrevDayNotApproval)")
                        .foregroundColor(Color.red)
                }
                .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                HStack{
                    Text("배당")
                        .font(.system(size:11))
                    Text("\(totalTodayAllocation)")
                    Text("종결")
                        .font(.system(size:11))
                    Text("\(totalTodayEnding)")
                        .foregroundColor(Color.blue)
                    Text("미결")
                        .font(.system(size:11))
                    Text("\(totalTodayNotApproval)")
                        .foregroundColor(Color.red)
                }
            }
        }
        .background(Color.black.opacity(0.05))
        .padding([.leading,.trailing])
    }
    
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
              
              ScrollView(.horizontal) {
                  HStack {
                      Text("삼성정보입력팀")
                          .onTapGesture {
                              dailyReportVM.getDailyReport(report_date: "\(formattedReportDate)", work: 60, team_id: 0)
                          }
                      Text("삼성정보입력 1팀")
                          .onTapGesture {
                              dailyReportVM.getDailyReport(report_date: "\(formattedReportDate)", work: 60, team_id: 263)
                          }
                      Text("삼성정보입력 2팀")
                          .onTapGesture {
                              dailyReportVM.getDailyReport(report_date: "\(formattedReportDate)", work: 60, team_id: 264)
                          }
                      Text("삼성정보입력 3팀")
                          .onTapGesture {
                              dailyReportVM.getDailyReport(report_date: "\(formattedReportDate)", work: 60, team_id: 265)
                          }
                  }
                  .padding([.leading, .trailing])
              }
              
              Section(header: headerView()){
                List(performanceList) { aList in
                      HStack(spacing: 0){
                          Text("\(aList.userName)(\(aList.userSerial))")
                              .font(.system(size: 15))
                              .bold()
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                  Text("\(aList.prevDayNotApproval)")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("\(aList.todayAllocation)") //당일배당
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("\(aList.todayEnding)") //당일종결
                                      .font(.system(size: 13))
                                      .frame(minWidth: 68, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("\(aList.todayNotApproval)")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 78, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                          }
                          .font(.system(size: 11))
                          .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .trailing
                          )
                      }
                  }
              }.listStyle(PlainListStyle())
              Button("확인완료"){
              }
              .foregroundColor(.white)
              .frame(width: 150, height: 50)
              .background(Color.blue)
              .cornerRadius(10)
          }
          .navigationBarTitle("팀별 일일실적 확인", displayMode: .inline)
        }
        .onAppear(perform: {dailyReportVM.getDailyReport(report_date: "2023-05-01", work: 60, team_id: 263)}) //뷰가 화면에 나타났을때 실행
        
        //줄이기
        .onReceive(dailyReportVM.$performanceList, perform: {
            self.performanceList = $0
        })
        .onReceive(dailyReportVM.$teamMemberCnt, perform: {
            self.teamMemberCnt = $0
        })
        .onReceive(dailyReportVM.$totalPrevDayNotApproval, perform: {
            self.totalPrevDayNotApproval = $0
        })
        .onReceive(dailyReportVM.$totalTodayAllocation, perform: {
            self.totalTodayAllocation = $0
        })
        .onReceive(dailyReportVM.$totalTodayEnding, perform: {
            self.totalTodayEnding = $0
        })
        .onReceive(dailyReportVM.$totalTodayNotApproval, perform: {
            self.totalTodayNotApproval = $0
        })
    }//body
}

//struct DailyReportCheck_Previews: PreviewProvider {
//    static var previews: some View{
//        DailyReportCheck()
//    }
//}
