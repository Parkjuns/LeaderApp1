//
//  BoardVM.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
import Alamofire
import Combine

class BoardVM: ObservableObject {
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    var subscription = Set<AnyCancellable>() //메모리 정리 위해
    
    //현재페이지
    @Published var currentPage : Int = 1
    //게시물 리스트 totalCnt
    @Published var totalCnt : Int = 1
    //게시물 리스트
    @Published var noticeDataList : [NoticeData] = []
    //게시물 등록 이벤트
    @Published var writeSuccess = PassthroughSubject<(), Never>()
    
//    @Published var noticeContentData : [NoticeContentData] = [] //게시판 상세내용
    @Published var noticeContentData : NoticeContentData? = nil
    @Published var memoList : [MemoList] = [] //댓글 리스트
    
    //댓글등록
    @Published var regUserName: String = ""
    @Published var regDate: String = ""
    @Published var hit : Int = 0
    @Published var memoCnt : Int = 0
    
    init() {
        fetchMoreActionSubject.sink{[weak self] _ in
            guard let self = self else {return}
            self.fetchMore()
        }.store(in: &subscription)
    }
    
    //다음페이지 호출
    fileprivate func fetchMore(){
        let pageToLoad = currentPage + 1
        BoardApiService.getNoticeList(work_num: 0, page: pageToLoad)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("BoardVM completion: \(completion)")
            } receiveValue: { (totalCnt: Int, currentPage: Int, noticeData: [NoticeData]) in
                self.noticeDataList += noticeData
                self.totalCnt = totalCnt
                self.currentPage = currentPage
            }
            .store(in: &subscription)
    }
    
    //게시판 리스트 가져오기
    func getNoticeList(work_num: Int, page: Int) {
        print("BoardVM - getNoticeList() called")
        
        BoardApiService.getNoticeList(work_num: work_num, page: page)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("BoardVM completion: \(completion)")
            } receiveValue: { (totalCnt: Int, currentPage: Int, noticeData: [NoticeData]) in
                self.noticeDataList = noticeData
                self.currentPage = currentPage
                self.totalCnt = totalCnt
            }
            .store(in: &subscription)
    }
    
    //게시물 등록
    func writeBoard(work:Int, notice:Int, subject:String, memo:String, files:[URL]){
        print("BoardVM - writeBoard() called")
        
        BoardApiService.writeBoard(work: work, notice: notice, subject: subject, memo: memo, files: files)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
                
            } receiveValue: { (receivedUser: MinfoResponse) in //받은값
                print("AuthApiService - loginAndminfo - receivedUser \(receivedUser)")
//                self.writeBoard = receivedUser
                self.writeSuccess.send() //로그인 성공시 화면 변경 위해
            }.store(in: &subscription) //메모리 정리 위해
    }
    
    //게시물 상세내용
    func getNoticeContent(notice_no: Int){
        print("BoardVM - fetchBoardContentMain() called")
        
        BoardApiService.getNoticeContent(notice_no: notice_no)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("BoardVM completion: \(completion)")
            } receiveValue: { (noticeContentData: NoticeContentData, memoList: [MemoList]) in //받은값
                self.noticeContentData = noticeContentData
                self.memoList = memoList
            }.store(in: &subscription) //메모리 정리 위해
    }
    
    //댓글 등록
    func putMemo(nb_no: Int, memo: String){
        print("BoardVM - putMemo() called")
        
        BoardApiService.putMemo(nb_mo: nb_no, memo: memo)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("BoardVM completion: \(completion)")
            } receiveValue: { (regUserName: String,
                               regDate: String,
                               hit: Int,
                               memoCnt: Int,
                               memoList: [MemoList]) in
                self.memoList = memoList
                self.regUserName = regUserName
                self.regDate = regDate
                self.hit = hit
                self.memoCnt = memoCnt
            }.store(in: &subscription) //메모리 정리 위해
    }
    

}
