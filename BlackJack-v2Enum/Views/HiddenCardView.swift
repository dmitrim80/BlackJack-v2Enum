//
//  HiddenCardView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct HiddenCardView: View {
    var CardFlipped: String = "🂠"
    var body: some View {
        ZStack {
            Text(CardFlipped)
                .background(.indigo)
                .foregroundColor(.yellow)
                .cornerRadius(5)
                .font(.largeTitle)
                .cornerRadius(5)
                .fontWeight(.heavy)
                .scaleEffect(4.5)
                .padding(5)
                .shadow(radius: 0.5)
                .shadow(color: .black, radius: 10, x: 5, y: 5)
        }
    }
}

struct HiddenCardView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenCardView()
    }
}
