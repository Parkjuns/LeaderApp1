//
//  TeamMemberList.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  직원명부 > 상세페이지

import Foundation

import SwiftUI
import AlamofireImage

struct TeamMemberList : View {
    
    @EnvironmentObject var employeeVM : EmployeeVM
    var teamList : TeamList
    
    @State var memberList : [MemberList] = []
    
    var body : some View {
        
            NavigationView{
                VStack(alignment: .leading){
                    List(memberList) { aMember in
                        let url_ = ApiClient.MAIN_URL+(aMember.picturePath ?? "")
                        HStack{
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
                                    Text(aMember.jobLevel) //직급
                                        .font(.system(size:13))
                                        .padding(.bottom,3)
                                    Text(aMember.name) //이름
                                        .font(.system(size:13))
                                        .padding(.bottom,3)
                                }
                                HStack{
                                    Text(aMember.hp) //휴대폰번호
                                        .font(.system(size:13))
                                    
                                    if(aMember.officeTel != "-"){
                                        Text("|")
                                            .font(.system(size:13))
                                        Text("\(aMember.officeTel)") //내선번호
                                            .font(.system(size:13))
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    .listStyle(.plain)
                    Divider().background(Color.gray)
                    Spacer()
                }//VStack
            }//NavigationLink
            .onAppear(perform: {employeeVM.teamEmployeeList(team_id: teamList.teamID)})//넘어온 teamList의 teamID를 인자로 넘긴다
            .onReceive(employeeVM.$memberList, perform: { self.memberList = $0 }) //업뎃될때마다 뷰 렌더링 시키기
    }
}

//struct TeamDetailView_Previews: PreviewProvider {
//    static var previews: some View{
//        TeamMemberList()
//    }
//}
