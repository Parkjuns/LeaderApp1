//
//  ApiClient.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/15.
//

import Foundation
import Alamofire

final class ApiClient {
    static let shared = ApiClient()
    static let MAIN_URL = "http://192.168.0.86:8080/"
    static let BASE_URL = "http://192.168.0.86:8080/api/"
    
    let interceptors = Interceptor(interceptors:
                                    [
                                        BaseInterceptor() //application/json
                                    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session //AF의 역할
    
    init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}
