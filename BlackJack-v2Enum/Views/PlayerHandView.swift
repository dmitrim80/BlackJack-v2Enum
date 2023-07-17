//
//  PlayerHandView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct PlayerHandView: View {
    @StateObject private var viewModel = BlackJackViewModel()
    let hand: [BlackJackCardModel]
    let hide2ndCard: Bool
    
    var body: some View {
        ZStack{
            ForEach(0..<hand.count, id: \.self) { index in
                if hide2ndCard && index == 1 {
                    if viewModel.isCardHidden {
                        HiddenCardView()
                            .offset(x: CGFloat(index * 120) - 50, y: -20)
                            .scaleEffect(1)
                    } else {
                        CardView(card: hand[index])
                            .offset(x: CGFloat(index * 30) - 50, y: 0)
                            .scaleEffect(1)
                    }
                } else {
                    CardView(card: hand[index])
                        .offset(x: CGFloat(index * 30) - 50, y: 0)
                        .scaleEffect(1)
                }
            }
        }
    }
}


struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PlayerHandView(hand: Array(BlackJackCardModel.sample.prefix(upTo: 2)), hide2ndCard: true)
               // .rotationEffect(.degrees(180))
            Divider()
            PlayerHandView(hand: Array(BlackJackCardModel.sample.prefix(upTo: 4)), hide2ndCard: false)
            
        }
    }
}
