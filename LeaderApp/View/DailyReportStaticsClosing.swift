//
//  DailyReportStaticsClosing.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  일일평균종결

import Foundation
import SwiftUI

struct DailyReportStaticsClosing : View {
    
    //리스트 고정헤더
    func headerView() -> some View{
        HStack{
            VStack(alignment: .trailing){
                HStack(spacing: 0){
                    Text("2023-04")
                    Spacer()
                    Text("전체")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                    Text("5,666")
                        .frame(width:60, alignment: .trailing)
                    Text("건")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                    Spacer().frame(width:20)
                    Text("평균")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                    Text("296.5")
                        .frame(width:60, alignment: .trailing)
                    Text("건")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                }
                .padding(.bottom,1) //라인 사이 패딩
                HStack(spacing: 0){
                    Text("세부내역배당")
                        .font(.system(size: 10))
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("5,666")
                        .frame(width:50, alignment: .trailing)
                    Text("건")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                    Spacer().frame(width:20)
                    Text("296.5")
                        .frame(width:77, alignment: .trailing)
                    Text("건")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                }
            }
        }
    }
    
    var body : some View {
        NavigationView {
          VStack {
              HStack{
                  Text("삼성정보입력 1팀")
                      .bold()
                  Spacer()
                  Text("\(Date(), formatter: DailyReportCheck.dateformat)")
                      .bold()
              }.padding()
              List{
                  Section(header: headerView()){
                      HStack{
                          VStack(alignment: .trailing){
                              HStack(spacing: 0){
                                  Text("2023-04-03")
                                  Spacer()
                                  Text("4,138")
                                      .frame(width:50, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                                  Spacer().frame(width:20)
                                  Text("357.3")
                                      .frame(width:77, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                              }
                              .padding(.bottom,1) //라인 사이 패딩
                              HStack(spacing: 0){
                                  Text("세부내역배당")
                                      .font(.system(size: 10))
                                      .foregroundColor(Color.gray)
                                  Spacer()
                                  Text("3,511")
                                      .frame(width:50, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                                  Spacer().frame(width:20)
                                  Text("229.0")
                                      .frame(width:77, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                              }
                          }
                      }
                      HStack{
                          VStack(alignment: .trailing){
                              HStack(spacing: 0){
                                  Text("2023-04-04")
                                  Spacer()
                                  Text("3,586")
                                      .frame(width:50, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                                  Spacer().frame(width:20)
                                  Text("235.5")
                                      .frame(width:77, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                              }
                              .padding(.bottom,1) //라인 사이 패딩
                              HStack(spacing: 0){
                                  Text("세부내역배당")
                                      .font(.system(size: 10))
                                      .foregroundColor(Color.gray)
                                  Spacer()
                                  Text("5,106")
                                      .frame(width:50, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                                  Spacer().frame(width:20)
                                  Text("196.5")
                                      .frame(width:77, alignment: .trailing)
                                  Text("건")
                                      .foregroundColor(Color.gray)
                                      .font(.system(size: 10))
                              }
                          }
                      }
                  }
              }.listStyle(PlainListStyle())
          }
        }
    }//View
}

struct DailyReportStaticsClosing_Previews: PreviewProvider {
    static var previews: some View{
        DailyReportStaticsClosing()
    }
}
