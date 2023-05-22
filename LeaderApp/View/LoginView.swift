//
//  LoginView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//  로그인화면

import Foundation
import SwiftUI

struct LoginView : View {
    
    @StateObject var userVM : UserVM = UserVM()
    
    @State fileprivate var shouldShowAlert : Bool = false //알림
    @State fileprivate var isLoggedin : Bool = false
    
    @State var user_serial : String = "" //변경감지하기 위해
    @State var pw : String = "" //변경감지하기 위해
    
    var body : some View {
        NavigationView{
            VStack {
                Text("리더스")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("사원번호", text: $user_serial)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                SecureField("비밀번호", text: $pw)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.default)
                
                Button("로그인"){
                    let name = UIDevice.current.name // iphone 13 pro
                    //let sysName = UIDevice.current.systemName // ios
                    let sysName = "i"
                    let sysVersion = UIDevice.current.systemVersion // 14.2
                    let appVersion = "100"
//                    userVM.loginAndminfo(user_serial: "lds200113", pw: "flejtm200113!", device: name, os: sysName, os_version: sysVersion, app_version: appVersion)
//                    userVM.loginAndminfo(user_serial: "lds230097", pw: "flejtm200113!", device: name, os: sysName, os_version: sysVersion, app_version: appVersion)
                    userVM.loginAndminfo(user_serial: "lds180077", pw: "flejtm200113!", device: name, os: sysName, os_version: sysVersion, app_version: appVersion)
                }
                
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .onReceive(userVM.loginSuccess) { _ in
                    print("Login - success()")
                    self.shouldShowAlert = true
                    self.isLoggedin = true // 로그인이 성공하면 true로 변경
                }
                
            }//VStack
        }
        //        .onChange(of: isLoggedin) { newValue in
        //            if newValue {
        //                isLoggedin = true
        //            }
        //        }
        .fullScreenCover(isPresented: $isLoggedin) {
            ContentView()
        }
        .environmentObject(userVM)
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
