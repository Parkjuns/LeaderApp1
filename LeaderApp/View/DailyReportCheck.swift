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
                .bold()
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
                          .background(Color.gray)
                      Text("삼성정보입력 1팀")
                          .background(Color.gray)
                      Text("삼성정보입력 2팀")
                          .background(Color.gray)
                      Text("삼성정보입력 3팀")
                          .background(Color.gray)
                  }
                  .padding([.leading, .trailing])
                  .background(Color.yellow)
              }
              
              Section(header: headerView()){
              }
              List(performanceList) { aList in
                HStack{
                    Text("\(aList.userName)(\(aList.userSerial))")
                        .font(.system(size: 15))
                        .bold()
                    Spacer()
                    VStack(alignment: .trailing){
                        HStack{
                            Text("\(aList.prevDayNotApproval)")
                                .foregroundColor(Color.red)
                        }
                        //                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                        HStack{
                            Text("\(aList.todayAllocation)") //당일배당
                                .padding(.trailing,40)
                            //                                  .font(.system(size: 15))
                                .backgroundStyle(Color.yellow)
                            Text("\(aList.todayEnding)") //당일종결
                                .foregroundColor(Color.blue)
                                .padding(.trailing,29)
                                .backgroundStyle(Color.yellow)
                            Text("\(aList.todayNotApproval)") //당일미결
                                .foregroundColor(Color.red)
                                .backgroundStyle(Color.yellow)
                        }
                    }
                }
              }.listStyle(.plain)
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
//        .onReceive(dailyReportVM.$performanceList.combineLatest(dailyReportVM.$teamMemberCnt
//                                                                , dailyReportVM.$teamMemberCnt
//                                                                , dailyReportVM.$totalPrevDayNotApproval
//                                                                , dailyReportVM.$totalTodayAllocation
//                                                                , dailyReportVM.$totalTodayEnding
//                                                                , dailyReportVM.$totalTodayNotApproval))
//
//        { updatedPerformanceList, updatedTeamMemberCnt, updatedTotalPrevDayNotApprovaltalTodayAllocation, totalTodayEnding, totalTodayNotApproval in
//            self.performanceList = updatedPerformanceList
//            self.teamMemberCnt = updatedTeamMemberCnt
//            self.totalTodayEnding = updatedTotalTodayEnding
        })
//        .onReceive(dailyReportVM.$performanceList, perform: {
//            self.performanceList = $0
//            self.teamMemberCnt = dailyReportVM.teamMemberCnt
//        }) //데이터를 수신할 때 실행. 앱의 상태변화나 외부이벤트의 응답으로 뷰를 업데이트 가능.
    }//body
}

//struct DailyReportCheck_Previews: PreviewProvider {
//    static var previews: some View{
//        DailyReportCheck()
//    }
//}
