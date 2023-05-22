//
//  DailyReportStaticsContentView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import SwiftUI
import SlidingTabView

struct DailyReportStaticsContent: View {
    
    
    //State가 변경이 되면 화면을 다시 그린다.
    @State private var tabIndex = 0
    var txtDate = ""
    var body : some View {
        
        
        NavigationView{
            VStack {
                SlidingTabView(selection: $tabIndex,
                               tabs: ["일일배당 및 미결", "일일배당 및 미결(세부내역)", "일일평균종결"],
                               animation: .easeInOut,
                               activeAccentColor: .green,
                               selectionBarColor: .green)
                if tabIndex == 0 {
                    DailyReportStatics()
                } else if tabIndex == 1 {
                    DailyReportStaticsDetail()
                } else if tabIndex == 2 {
                    DailyReportStaticsClosing()
                }
                Spacer()
            }//VStack
        }//NavigationLink
//        .onAppear(perform: {boardVM.fetchBoards(work_num: 0, page: 0)})
//        .onReceive(boardVM.$boards, perform: { self.boards = $0 })
    }//View
}

struct DailyReportStaticsContent_Previews: PreviewProvider {
    static var previews: some View{
        DailyReportStaticsContent()
    }
}
