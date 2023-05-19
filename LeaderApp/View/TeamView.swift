//
//  TeamView.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import SwiftUI

struct TeamView : View {
    
    @EnvironmentObject var employeeVM : EmployeeVM

    @State var teams : [TeamList] = []
    
    var body : some View {
        NavigationView {
            VStack(alignment: .leading){
                List(teams) { aTeam in
                    NavigationLink(destination: TeamMemberList(teamList : aTeam)) { //팀 번호 넘겨야함
                        VStack(alignment: .leading){
                            HStack{
                                Text(aTeam.workName) //업무
                                    .font(.system(size:13))
                                    .background(Color(#colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1))) // #bdbdbd 색상
                                    .foregroundColor(Color.black)
                                Text(aTeam.ancestorName) //본사, 수도권, 서면심사 ..
                                    .font(.system(size:13))
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            HStack{
                                Text(aTeam.teamName) //팀명
                                    .font(.system(size:13, weight: .heavy))
                                Spacer()
                                Text("\(aTeam.memberCnt)명") //인원
                                    .font(.system(size:13))
                                Spacer()
                                Text(aTeam.teamTell) //전화번호
                                    .font(.system(size:13))
                            }
                            .padding(.bottom, 5)
                            HStack{
                                Text(aTeam.teamAddr) //주소
                                    .font(.system(size:13))
                                    .foregroundColor(Color.gray)
                            }
                        }//VStack
                    }
                }//List
                .listStyle(.plain)
                .padding()
                Spacer()
            }//VStack
            .navigationBarTitle("직원명부", displayMode: .inline)
        }//Navigation
        .onAppear(perform: {employeeVM.teamList()})
        .onReceive(employeeVM.$teams, perform: { self.teams = $0 })
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View{
        TeamView()
    }
}
