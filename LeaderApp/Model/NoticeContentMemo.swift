//
//  NoticeContentMemo.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//

import Foundation
import SwiftUI

struct BoardContentMemoView : View {
    
    var memoList: [MemoList]
    
    
    var body : some View {
        Divider().background(Color.blue)
        ScrollView {
            LazyVStack{
                ForEach(memoList, id: \.id) { aMemo in
                    
                    let url_ = ApiClient.MAIN_URL+(aMemo.picturePath ?? "")
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
                                Text(aMemo.regUserName) //등록유저
                                    .font(.system(size:13))
                                Text(aMemo.jobLevel) //등록유저직급
                                    .font(.system(size:13))
                                Spacer()
                                Text(aMemo.regDate) //등록날짜
                                    .font(.system(size:13))
                                    .padding(.trailing, 10)
                            }
                            Text(aMemo.memo) //내용
                                .font(.system(size:13))
                                .padding(.top, 1)
                                .padding(.leading, 0)
                        }
                    }//HStack
                    Divider()
                        .background(Color.blue)
                }
            }
            .listStyle(.plain)
            .font(.system(size:13))
        }
    }
}
