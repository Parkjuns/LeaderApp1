//
//  BoardContentView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//  게시판 상세내용

import Foundation
import SwiftUI

struct BoardContentView : View {
    
    @EnvironmentObject var boardVM : BoardVM
    var noticeData : NoticeData
    
    @State var noticeContentData : NoticeContentData? = nil
    @State var memoList : [MemoList] = [] //댓글 리스트
    
    
    @State private var content: String = "" //댓글창
    
    var body : some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                   
                    //작성자, 날짜
                    HStack{
                        Text(noticeContentData?.regUserName ?? "") //작성자
                            .font(.system(size:13))
                        Spacer()
                        Text(noticeContentData?.regDate ?? "") //날짜
                            .font(.system(size:13))
                    }
                    .padding([.leading, .trailing])
                    Divider().background(Color.blue)
                    
                    // 뷰, 댓글수
                    HStack{
                        Image(systemName: "eye.fill")
                            .font(.system(size:13))
                        Text("\(noticeContentData?.hit ?? 0)") //뷰
                            .font(.system(size:13))
                        Text("+ \(noticeContentData?.memoCnt ?? 0)") //댓글
                            .font(.system(size:13))
                            .foregroundColor(Color.red)
                    }
                    .padding([.leading, .trailing])
                
                    
                    //내용
                    Text(noticeContentData?.memo ?? "")
                        .font(.system(size:13))
                        .padding()
                    
                    ScrollView{
                        LazyVStack{
                            if let file1 = noticeContentData?.file1 {
                                Text(file1)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(10)
                                    .font(.system(size:13))
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                    //첨부파일
//                    ScrollView {
//                        LazyVStack(alignment: .leading){
//                            Button(action: {
//                                // 파일 다운로드 함수 호출
//                                boardVM.fileDownload(notice_no: 1503, file_name: boardContentDataMain?.file1 ?? "")
//                            }) {
//                                Text(boardContentDataMain?.file1 ?? "")
//                                    .background(Color.gray)
//                                    .foregroundColor(.blue)
//                                    .padding()
//                                    .font(.system(size:13))
//                            }
////                            Text(boardContentDataMain?.file1 ?? "")
////                            Text(boardContentDataMain?.file2 ?? "")
////                            Text(boardContentDataMain?.file3 ?? "")
////                            Text(boardContentDataMain?.file4 ?? "")
////                            Text(boardContentDataMain?.file5 ?? "")
//                        }
//                    }
//                    .font(.system(size:13))
                    
                    
                    //작성자, 직급, 팀명
                    HStack{
                        let url_ = ApiClient.MAIN_URL+(noticeContentData?.picturePath ?? "")
                        AsyncImage(url: URL(string: url_)!) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding()
                        VStack(alignment: .leading){
                            HStack{
                                Text(noticeContentData?.regUserName ?? "") //작성자
                                    .font(.system(size:13))
                                Text(noticeContentData?.jobLevel ?? "") //직급
                                    .font(.system(size:13))
                            }
                            HStack{
                                Text(noticeContentData?.teamName ?? "") //팀명
                                    .font(.system(size:13))
                                Spacer()
                            }
                        }
                    }
                    
                    Text("댓글 \(noticeContentData?.memoCnt ?? 0)개")
                        .font(.system(size:13))
                        .padding([.leading, .trailing])
                    
                    //댓글영역
                    BoardContentMemoView(memoList: self.memoList)
                    
                    Spacer()
                    
                    //등록칸
                    HStack{
                        TextField("내용을 입력해주세요", text: $content)
                            .textFieldStyle(.roundedBorder)
                            .frame(minHeight: 50, maxHeight: 50)
                            .font(.system(size:13))
                        Button(action: {
                            // 버튼 클릭 시 실행할 코드
                            boardVM.putMemo(nb_no: noticeData.no, memo: content)
                        }, label: {
                            Text("등록")
                                .font(.system(size: 13))
                                .frame(height: 30, alignment: .leading)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .background(Color.blue)
                        })
                    }.padding()
                }//VStack
            }//ScrollView
            .navigationBarTitle(noticeContentData?.subject ?? "", displayMode: .inline)
        }//NavigationView
        .onAppear(perform: { // 앞에서 받아온 boardData의 no를 게시판 상세내용vm의 인자로 전달
            print("BoardContentView onAppear() called")
            boardVM.getNoticeContent(notice_no: noticeData.no)
        })
        .onReceive(boardVM.$noticeContentData, perform: { self.noticeContentData = $0 })
        .onReceive(boardVM.$memoList, perform: { self.memoList = $0 }) //boardMemoList를 받아와서 그린다.
    }
}
