//
//  BoardView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//  게시판 화면

import Foundation
import SwiftUI
import SlidingTabView

struct BoardView : View {
    
    //modal view 상태변경
    @State var isPresented: Bool = false
    
    @EnvironmentObject var boardVM : BoardVM
    
    @State private var tabIndex = 0
    //State가 변경이 되면 화면을 다시 그린다.
    @State var noticeDataList : [NoticeData] = []
    
    var body : some View {
        NavigationView{
            VStack {
                SlidingTabView(selection: $tabIndex,
                               tabs: ["전체 게시판", "팀 게시판"],
                               animation: .easeInOut,
                               activeAccentColor: .black,
                               selectionBarColor: .black)
                if tabIndex == 0 {

                    List(noticeDataList) { aNotice in
                        HStack{
                            VStack(alignment: .leading){
                                NavigationLink(destination: BoardContentView(noticeData: aNotice)) {
                                    Text(aNotice.subject)
                                        .font(.system(size:15))
                                        .padding(.bottom, 5)
                                        .onAppear{
                                            if self.boardVM.noticeDataList.last == aNotice {
//                                                print("마지막")
                                                boardVM.fetchMoreActionSubject.send()
                                            }
                                        }
                                }
                                HStack{
                                    Text(aNotice.regDate)
                                        .font(.system(size:13))
                                    Image(systemName: "eye.fill")
                                        .font(.system(size:13))
                                    Text("\(aNotice.hit)") //뷰
                                        .font(.system(size:13))
                                    Text("+\(aNotice.memoCnt)") //댓글
                                        .font(.system(size:13))
                                }
                            }
                            Spacer()
                            Text(aNotice.regUserName)
                                .font(.system(size:15))
                        }
                        .frame(height: 50)
                        
                    } //List
                    .listStyle(.plain)
                    HStack{
                        Spacer()
                            Button(action: { self.isPresented.toggle() }) { //모달뷰 상태 변경
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.yellow)
                                    .padding([.trailing])
                            }.sheet(isPresented: $isPresented) {
                                BoardWrite()
                            }
                    }
                } else if tabIndex == 1 {
                    Text("Friends")
                } else if tabIndex == 2 {
                    Text("Settings")
                }
                Spacer()
            }//VStack
        }//NavigationLink
        .onAppear(perform: {boardVM.getNoticeList(work_num: 0, page: boardVM.currentPage)})
        .onReceive(boardVM.$noticeDataList, perform: { self.noticeDataList = $0 })
    }//View
}
