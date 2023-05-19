//
//  LoginRouter.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/15.
//

import Foundation
import Alamofire

enum LoginRouter: URLRequestConvertible {
    
    case login(user_serial: String, pw: String)
    case minfo(device: String, os: String, os_version: String, app_version: String)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .login:
            return "auth/login"
        case .minfo:
            return "user/minfo"
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .login :
            return .post
        case .minfo :
            return .put
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .login(user_serial, pw):
            var params = Parameters()
            params["user_serial"] = user_serial
            params["pw"] = pw
            return params
            
        case let .minfo(device, os, os_version, app_version):
            var params = Parameters()
            params["device"] = device
            params["os"] = os
            params["os_version"] = os_version
            params["app_version"] = app_version
            return params
        }
    }
    
    //최종 URLRequest
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        return request
    }
    
}
