//
//  ConversationView.swift
//  TwitterSwiftUITutorial
//
//  Created by Xiah Lee on 2021/11/25.
//

import SwiftUI

struct ConversationView: View {
    
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                //LazyVStack과 VStack의 차이점
                //LazyVStack는 콘텐츠가 뷰를 로드하고, 너비가 유연함. VStack은 스크롤을 하기전부터 전부 로드한다.
                VStack {
                    ForEach(0..<10) { _ in
                        NavigationLink(
                            destination: Text("Chat View"),
                            label: {
                                ConversationCell()
                            }
                        )
                    }
                }
                .padding()
            }
            
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $isShowingNewMessageView, content: {
                    SearchView()
                })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
