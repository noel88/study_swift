//
//  FeedView.swift
//  TwitterSwiftUITutorial
//
//  Created by Xiah Lee on 2021/11/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                //LazyVStack과 VStack의 차이점
                //LazyVStack는 콘텐츠가 뷰를 로드하고, 너비가 유연함. VStack은 스크롤을 하기전부터 전부 로드한다.
                LazyVStack {
                    ForEach(0..<10) { _ in
                         TweetCell()
                    }
                }
                .padding()
            }
            
            Button(action: {}, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template) // .original: 항상 이미지 본래의 색 유지, .template: 이미지의 불투명 영역이 가진 본래의 색을 무시하고 원하는 색으로 변경해 템플릿 이미지 활용
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
