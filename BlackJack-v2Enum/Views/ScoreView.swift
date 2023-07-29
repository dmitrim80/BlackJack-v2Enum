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
        ZStack{
            Image(systemName: "bubble.left")
                .scaleEffect(2.8)
                .foregroundColor(.white)
                .frame(width:170, height: 50)
            
            if handValue > 21 {
                Text("Bust!")
                    .foregroundColor(.red)
                    .font(.title)
                    .onAppear {
                        viewModel.numberOfHitsRemaining = 0 // Disable the "Hit" button when handValue is greater than 21
                        viewModel.isCardHidden = false
                    }
                
            }
            else if handValue == 21 {
                Text("BLACKJACK!")
                    .foregroundColor(Color("BJGold"))
                    .font(.title)
                    .onAppear {
                        viewModel.numberOfHitsRemaining = 0 // Disable the "Hit" button when handValue is greater than 21
                        viewModel.isCardHidden = false
                    }
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

