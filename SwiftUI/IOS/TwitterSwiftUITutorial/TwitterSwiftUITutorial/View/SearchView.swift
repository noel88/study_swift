//
//  SearchView.swift
//  TwitterSwiftUITutorial
//
//  Created by Xiah Lee on 2021/11/25.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    UserCell()
                }
            }
            .padding(.leading)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
