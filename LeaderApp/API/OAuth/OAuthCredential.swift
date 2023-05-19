//
//  OAuthCredential.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
import Alamofire

struct OAuthCredential : AuthenticationCredential {
    let token: String
    
    var requiresRefresh: Bool = false //필수
}
