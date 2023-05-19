//
//  ContentView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/16.
//

import Foundation
import SwiftUI

struct ContentView : View {
    
    @StateObject var boardVM = BoardVM()
    @StateObject var employeeVM = EmployeeVM()
    
    var body: some View {
        TabView {
            
            BoardView()
            .environmentObject(boardVM)
            .tabItem {
              Image(systemName: "message")
              Text("게시판")
            }
            
            TeamView()
            .environmentObject(employeeVM)
            .tabItem {
              Image(systemName: "person.2")
              Text("직원명부")
            }
        
//            Text("1")
            MyPage()
            .tabItem {
              Image(systemName: "ellipsis")
              Text("기타")
            }
            .badge(10)
        }
        .font(.headline)
    }
}
