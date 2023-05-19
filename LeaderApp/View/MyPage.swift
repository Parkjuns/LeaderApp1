//
//  MyPage.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  기타 페이지

import Foundation
import SwiftUI

struct Layout {
    var id: Int
    let title, symbol: String
}

struct MyPage : View {
    
    
    @State var isPresented: Bool = false
    let layout: [Layout] = [
        Layout(id: 0, title: "실적입력1", symbol: "tv.fill"),
        Layout(id: 1, title: "실적입력2", symbol: "tv.fill")
    ]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Image("iu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding()
                    VStack(alignment: .leading){
                        HStack{
                            Text("이름") //이름
                                .padding(.bottom,3)
                            Text("직급") //직급
                                .padding(.bottom,3)
                        }
                        Text("전산개발팀")

                    }
                    Spacer()
                }
                Divider().background(Color.gray)
                    ScrollView(.horizontal) {
                       LazyHStack {
//                           ForEach(0...5, id: \.self) { i in
                           Button(action: { self.isPresented.toggle() }) {
                              VStack {
                                 Image(systemName: "chart.bar.fill")
                                     .frame(width: 100, height: 50)
                                 Text("실적입력")
                                     .foregroundColor(.secondary)
                                     .padding(.all, 10)
                             }
                           }.sheet(isPresented: $isPresented) {
                               DailyReport()
                           }
                           
                           NavigationLink(destination: DailyReportCheck()) {
                               VStack {
                                   Image(systemName: "doc.fill")
                                       .frame(width: 100, height: 50)
                                   Text("일일실적확인")
                                       .foregroundColor(.secondary)
                                       .padding(.all, 10)
                               }
                           }
                           
                           NavigationLink(destination: DailyReportStaticsContent()) {
                               VStack {
                                   Image(systemName: "doc.fill")
                                       .frame(width: 100, height: 50)
                                   Text("일일보고")
                                       .foregroundColor(.secondary)
                                       .padding(.all, 10)
                               }
                           }
                           .padding(.all, 8)
                       }
                    } .frame(height: 100)//스크롤의 프레임 설정
                Spacer()
           }
            .navigationBarTitle("더보기", displayMode: .inline)
        }//NavigationLink
    }
}

struct LayoutView: View{
    let layout: Layout
    var body: some View{
        VStack{
            Image(systemName: layout.symbol)
                .resizable()
                .frame(width: 80, height: 80)
            Text(layout.title)
                .font(.subheadline)
        }
    }
}

struct MyPage_Previews: PreviewProvider {
    static var previews: some View{
        MyPage()
    }
}
