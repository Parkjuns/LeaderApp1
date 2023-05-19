//
//  BoardRouter.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//  게시판

import Foundation
import Alamofire

enum BoardRouter: URLRequestConvertible {
    
    case getNoticeList(work_num: Int, page: Int = 0) //초기값 설정
    case writeBoard(work: Int, notice: Int, subject: String, memo: String, files: [URL]) //게시물등록
    case getNoticeContent(notice_no: Int) //게시물 상세페이지
    case putMemo(nb_no: Int, memo: String) //댓글등록
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getNoticeList(let work_num, let page):
            return "board/list/\(work_num)/page/\(page)"
        case .writeBoard:
            return "board/write"
        case .getNoticeContent(let notice_no):
            return "board/notice/\(notice_no)"
        case .putMemo:
            return "board/memo"
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .getNoticeList :
            return .get
        case .writeBoard:
            return .post
        case .getNoticeContent:
            return .get
        case .putMemo:
            return .put
        }
    }
    
    typealias EmptyParameters = [String: Any]
    var parameters: Parameters {
        switch self {
        case let .putMemo(nb_no, memo):
            var params = Parameters()
            params["nb_no"] = nb_no
            params["memo"] = memo
            return params
        default:
            return EmptyParameters()
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        print("asURLRequest - request : \(request)")
        
        switch self {
        case .writeBoard(let work, let notice, let subject, let memo, let files):
//            request.addValue("multipart/form-data", forHTTPHeaderField: "Content-type")
            
            let headers: HTTPHeaders = [
                "Content-type": "multipart/form-data",
                "Accept": "application/json",
                "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25vIjoxNzg3LCJ1c2VyX3NlcmlhbCI6ImxkczIwMDExMyIsIm5hbWUiOiJcdWJjMTVcdWM3NDBcdWM5YzAiLCJ0ZWFtX2lkIjoiMjU5IiwidGVhbV9uYW1lIjoiXHVjODA0XHVjMGIwXHVhYzFjXHViYzFjXHVkMzAwIiwid29yayI6IjEwIiwiam9iX2xldmVsIjoiXHViMzAwXHViOWFjIn0.Yi84kQ1bXE-ok6eA9pl8mbHGfyD4SsuStzJwAc2BEGc"
            ]
            
            let parameters: [String : Any] = [
                       "work": work,
                       "notice": notice,
                       "subject": subject,
                       "memo": memo
                   ]
            
            AF.upload(multipartFormData: { multipartFormData in
                //첨부파일
                for url in files {
                    multipartFormData.append(url, withName: "files")
                }
                //파라미터
                for (key, value) in parameters {
                    print("multipartFormData == \(key) , \(value)")
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }, to: url, method: .post, headers: headers)
            .response { response in
                print("== response debugDscription == \(response.debugDescription)")
            }
        default:
            // HTTP GET 요청에서는 httpBody를 설정하지 않도록 처리
            //.httpBody: POST 전송에서 사용되는 HTTP Body 방식으로 인코딩
            if method != .get {
                request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
            }
            print("request == \(request)")
        }
        
        return request
    }
}
