//
//  DeckView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/23/23.
//

import SwiftUI

struct DeckView: View {
    var body: some View {
        ZStack{
            ForEach(0..<25) { index in
            HiddenCardView()
                    .offset(x: CGFloat(index * 2) - 10, y: 0)
                    .scaleEffect(0.9)
                    .opacity(0.9)
                    //.rotationEffect(Angle(degrees: 120))
                    .rotation3DEffect(Angle(degrees: 120), axis: (x: 0, y: 0, z: 1))
                    
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
