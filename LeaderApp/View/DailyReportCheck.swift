//
//  DailyReportCheck.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  실적입력확인

import Foundation
import SwiftUI

struct DailyReportCheck : View {
    @State var a: String = ""
    @State var b: String = ""
    @State var c: String = ""
    @State var d: String = ""
    
    static let dateformat: DateFormatter = {
          let formatter = DateFormatter()
           formatter.dateFormat = "YYYY년 MM월 dd일"
           return formatter
       }()
    
    
    //리스트 고정헤더
    func headerView() -> some View{
        HStack{
            Text("전체 27명")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .bold()
            Spacer()
            VStack(alignment: .trailing){
                HStack{
                    Text("전일미결")
                        .font(.system(size:11))
                    Text("1")
                        .foregroundColor(Color.red)
                }
                .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                HStack{
                    Text("배당")
                        .font(.system(size:11))
                    Text("15708")
                    Text("종결")
                        .font(.system(size:11))
                    Text("15708")
                        .foregroundColor(Color.blue)
                    Text("미결")
                        .font(.system(size:11))
                    Text("0")
                        .foregroundColor(Color.red)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
          VStack {
              Text("\(Date(), formatter: DailyReportCheck.dateformat)")
                  .font(.title)
                  .bold()
                  .padding(.top,50)
              Text("삼성정보입력 1팀")
                  .font(.title3)
                  .padding(.top,5)
              List{
                  Section(header: headerView()){
                      HStack{
                          Text("강수현(72291523)")
                              .font(.system(size: 15))
                              .bold()
                          Spacer()
                          VStack(alignment: .trailing){
                              HStack{
                                  Text("1")
                                      .foregroundColor(Color.red)
                              }
//                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack{
                                  Text("345")
                                      .padding(.trailing,40)
                                      .font(.system(size: 15))
                                  Text("345")
                                      .foregroundColor(Color.blue)
                                      .padding(.trailing,29)
                                  Text("0")
                                      .foregroundColor(Color.red)
                              }
                          }
                      }
                      HStack{
                          Text("김동언(72291154)")
                              .font(.system(size: 15))
                              .bold()
                          Spacer()
                          VStack(alignment: .trailing){
                              HStack{
                                  Text("0")
                                      .foregroundColor(Color.red)
                              }
//                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack{
                                  Text("278")
                                      .padding(.trailing,40)
                                      .font(.system(size: 15))
                                  Text("278")
                                      .foregroundColor(Color.blue)
                                      .padding(.trailing,29)
                                  Text("0")
                                      .foregroundColor(Color.red)
                              }
                          }
                      }
                      HStack{
                          Text("김유강(72293127)")
                              .font(.system(size: 15))
                              .bold()
                          Spacer()
                          VStack(alignment: .trailing){
                              HStack{
                                  Text("0")
                                      .foregroundColor(Color.red)
                              }
//                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack{
                                  Text("278")
                                      .padding(.trailing,40)
                                      .font(.system(size: 15))
                                  Text("278")
                                      .foregroundColor(Color.blue)
                                      .padding(.trailing,29)
                                  Text("0")
                                      .foregroundColor(Color.red)
                              }
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
          .navigationBarTitle("팀별 일일배당 확인", displayMode: .inline)
        }
    }//body
}

struct DailyReportCheck_Previews: PreviewProvider {
    static var previews: some View{
        DailyReportCheck()
    }
}
