//
//  ConversationView.swift
//  TwitterSwiftUITutorial
//
//  Created by Xiah Lee on 2021/11/25.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                //LazyVStack과 VStack의 차이점
                //LazyVStack는 콘텐츠가 뷰를 로드하고, 너비가 유연함. VStack은 스크롤을 하기전부터 전부 로드한다.
                VStack {
                    ForEach(0..<10) { _ in
                        ConversationCell()
                    }
                }
            }
            
            Button(action: {}, label: {
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
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
