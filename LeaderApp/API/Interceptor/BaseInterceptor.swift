//
//  BaseInterceptor.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/15.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
    
    //api호출할 때 (.request 할때) 호출되는 부분 + 마지막에 completion
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var request = urlRequest
        
        //헤더부분 넣기
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        print("BaseInterceptor - adapt() called : \(request.headers)")
        completion(.success(request))
        
        //공통 파라미터 추가
//        var dictionary = [String:String]()
//        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")
        
    }
    
//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//        <#code#>
//    }
}
