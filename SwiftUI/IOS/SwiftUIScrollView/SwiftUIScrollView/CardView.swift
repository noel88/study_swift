//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Xiah Lee on 2021/11/16.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Image("swiftui-button")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text("SwiftUI")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("Drawing a Border with Rounded Corners")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text("Written by Simon Ng".uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
