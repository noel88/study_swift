//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Xiah Lee on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don ’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.bold)
            .font(.custom("Nunito", size: 25))
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .truncationMode(.head)
            .lineSpacing(10)
            .padding()
//            .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
            .rotation3DEffect(.degrees(60),axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x: 0, y: 15)
    }
}

#Preview {
    ContentView()
}
