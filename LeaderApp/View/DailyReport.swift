//
//  DailyReport.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  기타 > 개인실적

import Foundation
import SwiftUI

struct DailyReport : View {
    
    //modal view 상태변경
    @State var isPresented: Bool = false
       
    var body: some View {
        Text("개인실적")
        HStack{
            Spacer()
                Button(action: { self.isPresented.toggle() }) { //모달뷰 상태 변경
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color.yellow)
                        .padding([.trailing])
                }.sheet(isPresented: $isPresented) {
//                    DailyReportWrite()
                }
        }
    }//body

}

struct DailyReport_Previews: PreviewProvider {
    static var previews: some View {
        DailyReport()
    }
}
