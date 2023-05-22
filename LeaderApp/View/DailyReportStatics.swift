//
//  DailyReportStatics.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  일일배당 및 미결

import Foundation
import SwiftUI
import SlidingTabView

struct DailyReportStatics : View {
    @EnvironmentObject var dailyReportVM : DailyReportVM
    
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    //파라미터로 전달하기위해 포맷
    var formattedReportDate: String {
        return DailyReportWrite.dateformat.string(from: selectedDate)
    }
    
    //데이터 가져오기
    @State var performanceList : [PerformanceList] = []
    @State var teamMemberCnt : Int = 0
    @State var totalPrevDayNotApproval : Int = 0
    @State var totalTodayAllocation : Int = 0
    @State var totalTodayEnding : Int = 0
    @State var totalTodayNotApproval : Int = 0
    
    //리스트 고정헤더
    func headerView() -> some View{
        HStack{
            Text("전체 \(teamMemberCnt)건")
                .font(.system(size: 12))
                .foregroundColor(Color.black)
            Spacer()
            VStack(alignment: .trailing){
                HStack{
                    Text("전일미결")
                        .font(.system(size:10))
                    Text("\(totalPrevDayNotApproval)")
                        .foregroundColor(Color.red)
                }
                .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                HStack{
                    Text("배당")
                        .font(.system(size:10))
                    Text("\(totalTodayAllocation)")
                        .frame(minWidth: 45, alignment: .leading)
                    Text("종결")
                        .font(.system(size:10))
                    Text("\(totalTodayEnding)")
                        .foregroundColor(Color.blue)
                        .frame(minWidth: 47, alignment: .leading)
                    Text("미결")
                        .font(.system(size:10))
                    Text("\(totalTodayNotApproval)")
                        .foregroundColor(Color.red)
                }
            }
        }
        .font(.system(size: 12))
        .background(Color.black.opacity(0.05))
        .padding([.leading,.trailing])
    }
    
    var body : some View {
        NavigationView {
          VStack {
              HStack{
                  Text("삼성정보입력팀")
                      .bold()
                  Spacer()
                  Button {
                      showDatePicker.toggle()
                  } label: {
                      Text("\(selectedDate, formatter: DailyReportCheck.dateformat)")
                          .font(.title)
                          .bold()
                          .foregroundColor(Color.black)
                  }
                  
              }.padding()
              if showDatePicker {
                  DatePicker(
                      "",
                      selection: $selectedDate,
                      in: ...Date(),
                      displayedComponents: [.date]
                  )
                      .datePickerStyle(WheelDatePickerStyle()) // 피커스타일 wheel
                      .labelsHidden() //text 숨김
                      .onChange(of: selectedDate) { _ in
                          dailyReportVM.getDailyReportStaticContent(report_date: "\(formattedReportDate)", work: 60, part: 0)
                      }
              }
              
              Section(header: headerView()){
                  List(performanceList) { aList in
                      if(aList.userNo == 0){
                          HStack(spacing: 0){
                              Text("\(aList.teamName)")
                                  .font(.system(size: 12))
                              VStack(alignment: .trailing){
                                  HStack(spacing:0){
                                      Text("\(aList.prevDayNotApproval)")
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 25, alignment: .trailing)
                                          .foregroundColor(Color.red)
                                          .bold()
                                  }
                                  .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                                  HStack(spacing:0){
                                      Text("\(aList.todayAllocation)") //당일배당
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 50, alignment: .trailing)
                                          .bold()
                                      Spacer().frame(width: 10)
                                      Text("\(aList.todayEnding)") //당일종결
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 70, alignment: .trailing)
                                          .bold()
                                          .foregroundColor(Color.blue)
                                      Text("\(aList.todayNotApproval)")
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 78, alignment: .trailing)
                                          .foregroundColor(Color.red).bold()
                                  }
                              }
                              .font(.system(size: 12))
                              .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .trailing
                              )
                          }
                          .background(Color.black.opacity(0.05))
                      }
                      else{
                          HStack(spacing: 0){
                              Text("\(aList.userName)(\(aList.userNo))")
                                  .font(.system(size: 12))
                              VStack(alignment: .trailing){
                                  HStack(spacing:0){
                                      Text("\(aList.prevDayNotApproval)")
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 25, alignment: .trailing)
                                          .foregroundColor(Color.red)
                                  }
                                  .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                                  HStack(spacing:0){
                                      Text("\(aList.todayAllocation)") //당일배당
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 50, alignment: .trailing)
                                      Spacer().frame(width: 10)
                                      Text("\(aList.todayEnding)") //당일종결
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 70, alignment: .trailing)
                                          .foregroundColor(Color.blue)
                                      Text("\(aList.todayNotApproval)")
//                                              .font(.system(size: 15))
                                          .frame(minWidth: 78, alignment: .trailing)
                                          .foregroundColor(Color.red)
                                  }
                              }
                              .font(.system(size: 12))
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
              }
          }
        }
        .onAppear(perform: {dailyReportVM.getDailyReportStaticContent(report_date: "\(formattedReportDate)", work: 60, part: 0)}) //뷰가 화면에 나타났을때 실행
        
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
    }//View
}

struct DailyReportStatics_Previews: PreviewProvider {
    static var previews: some View{
        DailyReportStatics()
    }
}
