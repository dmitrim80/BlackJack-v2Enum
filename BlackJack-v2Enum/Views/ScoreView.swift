//
//  ScoreView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var viewModel: BlackJackViewModel
    let hand: [BlackJackCardModel]
    let hide2ndCard: Bool
    
    var handValue: Int {
        viewModel.engine.getScore(hand: hand, hide2ndCard: hide2ndCard)
    }
    
    var body: some View {
        
        return ZStack{
            Image(systemName: "bubble.left")
                .scaleEffect(2.8)
                .foregroundColor(.white)
            if handValue > 21 {
                Text("Bust!")
                    .foregroundColor(.red)
                    .font(.title)
                    .fontWeight(.heavy)
            } else if handValue == 21{
                Text("BLACKJACK!")
                    .foregroundColor(.red)
                    .font(.title)
                    .fontWeight(.heavy)
            }
            else {
                Text("\(handValue)")
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BlackJackViewModel()
        return ScoreView(hand: viewModel.playerHand, hide2ndCard: false)
            .environmentObject(viewModel)
            .background(.green)
    }
}

