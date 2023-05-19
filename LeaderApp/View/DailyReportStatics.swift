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
    
    //리스트 고정헤더
    func headerView() -> some View{
        
        HStack(spacing: 0){
            Text("전체 73건")
                .font(.system(size: 15))
                .bold()
            VStack(alignment: .trailing){
                HStack(spacing:0){
                  Text("전일미결")
                        .foregroundColor(Color.gray)
                  Text("1")
                        .font(.system(size: 15))
                        .frame(minWidth: 25, alignment: .trailing)
                        .foregroundColor(Color.red)
                }
                .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                HStack(spacing:0){
                    Text("배당")
                        .foregroundColor(Color.gray)
                    Text("12,372")
                        .font(.system(size: 13))
                        .frame(minWidth: 50, alignment: .trailing)
                    Spacer().frame(width: 10)
                    Text("종결")
                        .foregroundColor(Color.gray)
                    Text("2,372")
                        .font(.system(size: 13))
                        .frame(minWidth: 50, alignment: .trailing)
                        .foregroundColor(Color.blue)
                    Text("미결")
                        .foregroundColor(Color.gray)
                        .frame(minWidth: 25, alignment: .trailing)
                    Text("0")
                        .font(.system(size: 13))
                        .frame(minWidth: 25, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("삼성정보입력1팀(26명)")
                              .font(.system(size: 15))
                              .bold()
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("3,289")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("3,289")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      .background(Color.black.opacity(0.05))
                      HStack(spacing: 0){
                          Text("강수현(72291523)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("김기수(72293543)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("0")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("김동언(72291523)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("272")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("272")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("삼성정보입력2팀(28명)")
                              .font(.system(size: 15))
                              .bold()
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("4,412")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("4,412")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      .background(Color.black.opacity(0.05))
                      HStack(spacing: 0){
                          Text("강수현(72291523)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("김기수(72293543)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("0")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("김동언(72291523)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("272")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("272")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("강수현(72291523)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("1")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("356")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
                      HStack(spacing: 0){
                          Text("김기수(72293543)")
                              .font(.system(size: 15))
                          VStack(alignment: .trailing){
                              HStack(spacing:0){
                                Text("0")
                                      .font(.system(size: 15))
                                      .frame(minWidth: 25, alignment: .trailing)
                                      .foregroundColor(Color.red)
                              }
                              .padding(.bottom,1) //전일미결과 배당종결미결라인 사이 패딩
                              HStack(spacing:0){
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
                                  Spacer().frame(width: 10)
                                  Text("240")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 70, alignment: .trailing)
                                      .foregroundColor(Color.blue)
                                  Text("0")
                                      .font(.system(size: 13))
                                      .frame(minWidth: 50, alignment: .trailing)
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
          }
        }
    }//View
}

struct DailyReportStatics_Previews: PreviewProvider {
    static var previews: some View{
        DailyReportStatics()
    }
}
