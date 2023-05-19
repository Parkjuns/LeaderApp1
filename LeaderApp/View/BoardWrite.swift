//
//  BoardWrite.swift
//  LeaderApp
//
//  Created by leaders on 2023/05/18.
//  게시판 글작성

import Foundation

import SwiftUI
import Alamofire

struct BoardWrite : View {
    
    @StateObject var boardVM = BoardVM()
    
    @State private var title: String = ""   //제목
    @State private var content: String = "" //내용
    
    //첨부파일 관련
    @State var openFile = false //true : 작성화면 열리자마자 첨부파일 선택창이 뜬다
    @State var fileArr: [String] = [] //첨부파일 파일명
    @State var urls: [URL] = []
    
    //게시물등록 성공여부
    @State fileprivate var writeSuccess : Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                
                VStack{
                    TextField("제목", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size:13))
                        .padding()
                    TextEditor(text: $content)
                        .frame(minHeight: 200, maxHeight: 400, alignment: .top)
                        .border(Color.gray, width: 1)
                        .font(.system(size:13))
                        .padding()
                        .cornerRadius(8)
                    
                    Divider().background(Color.gray)
                }//제목,내용 VStack
                .frame(height:400)
                
                VStack{
                    HStack{
                        Text("첨부파일")
                        Spacer()
                        Button(action: { openFile.toggle() }, label: {
                            Image(systemName: "plus.square")
                        })
                    }
                    .padding()
                    
                    List{
                        ForEach(fileArr, id: \.self) { fileArr in
                            Text(fileArr)
                                .font(.system(size:13))
                        }
                        .onDelete(perform: removeRoes)
                    }
                    .listStyle(.plain)
                    
                    /**
                     [fileImporter : 첨부파일 선택]
                     -isPresented
                     -allowedContentTypes : 가져올 컨텐츠 타입
                     -allowsMultipleSelection : 사용자가 가져올 파일을 하나 이상 선택할 수 있는지 여부
                     -result : 성공,실패 나타내는 결과
                     -onCompletion : 성공,실패시 콜백
                     */
                    .fileImporter( isPresented: $openFile,
                                   allowedContentTypes: [.item],
                                   allowsMultipleSelection: true,
                                   onCompletion: { (result) in
                        
                        switch result {
                        case .success(let Fileurl):
                            //전달할 urls
                            for fileUrl in Fileurl {
                                urls.append(fileUrl)
                            }
                            urls = Array(Set(urls))
                            
                            //파일명만 fileArr에 저장
                            for url in Fileurl {
//                                print("url::\(Fileurl)")
                                fileArr.append(url.lastPathComponent)
                            }
                            fileArr = Array(Set(fileArr))
                            
                        case .failure(let error):
                            print(error)
                        }
                    })
                    Spacer()
                }//첨부파일 VStack
                
                HStack(spacing: 20){
                    Button("취소"){}
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                    Button("저장"){
                        print("저장버튼클릭") //api
                        boardVM.writeBoard(work: 0, notice: 0, subject: title, memo: content, files: urls)
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .onReceive(boardVM.writeSuccess) { _ in
                        self.writeSuccess = true
                    }
                }//HStack
            }
            .navigationBarTitle("글쓰기", displayMode: .inline)
        }//Navigation
    }
    
    //슬라이딩 삭제
    func removeRoes(at offsets: IndexSet) {
        fileArr.remove(atOffsets: offsets)
        urls.remove(atOffsets: offsets)
        print("removeRoes - \(fileArr)")
    }
}

fileprivate struct DismissButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("취소")
        }

    }
}

fileprivate struct SaveButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("저장")
        }

    }
}

struct BoardWriteView_Previews: PreviewProvider {
    static var previews: some View{
        BoardWrite()
    }
}
