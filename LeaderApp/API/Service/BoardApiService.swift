//
//  BoardApiService.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
import Combine
import Alamofire

enum BoardApiService {
    
    //전체 게시판 리스트
    static func getNoticeList(work_num: Int, page: Int) -> AnyPublisher<(Int, Int, [NoticeData]), AFError> {
        print("BoardApiService - getNoticeList() START!")
        
        // 토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(BoardRouter.getNoticeList(work_num: work_num, page: page), interceptor: authInterceptor)
            .publishDecodable(type: BoardListResponse.self)
            .value()
            .map { response in
                print("받은값 :: \(response.noticeList.count)")
                return (response.totalCnt, response.currentPage, response.noticeList)
            }
            .eraseToAnyPublisher()
    }
    
    //게시물 등록
    static func writeBoard(work:Int, notice:Int, subject:String, memo:String, files:[URL]) -> AnyPublisher<MinfoResponse, AFError> {
        print("BoardApiService - writeBoard() START!")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(BoardRouter.writeBoard(work: work, notice: notice, subject: subject, memo: memo, files: files), interceptor: authInterceptor)
            .publishDecodable(type: MinfoResponse.self) //userinfo 타입으로 디코딩
            .value() //디코딩 된 값 가져오기
            .map { receivedValue in //map을 이용해 receivedvalue 객체 그대로 반환
                return receivedValue.self
            }
            .eraseToAnyPublisher()
    }
    
    //게시판 > 상세페이지
    static func getNoticeContent(notice_no: Int) -> AnyPublisher<(NoticeContentData, [MemoList]), AFError>{
        print("BoardApiService - getNoticeContent() START!")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)

        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(BoardRouter.getNoticeContent(notice_no: notice_no), interceptor: authInterceptor)
            .publishDecodable(type: NoticeContentResponse.self)
            .value()
            .map { response in
                let noticeContentData = NoticeContentData(
                    memo: response.memo,
                    subject: response.subject,
                    file1: response.file1,
                    file2: response.file2,
                    file3: response.file3,
                    file4: response.file4,
                    file5: response.file5,
                    hit: response.hit,
                    memoCnt: response.memoCnt,
                    picturePath: response.picturePath,
                    regUserName: response.regUserName,
                    jobLevel: response.jobLevel,
                    teamName: response.teamName,
                    regDate: response.regDate
                )
                return (noticeContentData, response.memoList)
            }.eraseToAnyPublisher()
    }
    
    //댓글등록
    static func putMemo(nb_mo: Int, memo: String) -> AnyPublisher<(String, String, Int, Int, [MemoList]), AFError>{
        print("BoardApiService - putMemo() START!")
        
        //토큰 조회
        let storedTokenData = UserDefaultsManager.shared.getTokens() //저장된 토큰값을 가져온다
        let credential = OAuthCredential(token: storedTokenData.Authorization)
        
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(BoardRouter.putMemo(nb_no: nb_mo, memo: memo), interceptor: authInterceptor)
            .publishDecodable(type: NoticeContentResponse.self)
            .value()
            .map { response in
                return (response.regUserName,
                        response.regDate,
                        response.hit,
                        response.memoCnt,
                        response.memoList)
            }.eraseToAnyPublisher()
    }
}
  
