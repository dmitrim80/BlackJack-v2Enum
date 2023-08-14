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
    @State private var playerWin = false
    @State private var dealerWin = false
    @State private var noWinner = false
    
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
                VStack {
                    
                    Text("Bust!")
                        .foregroundColor(.red)
                        .font(.title)
                }
//                    .onAppear {
//                        if viewModel.cpuHandValue > 21 {
//                            playerWin = true
//                            viewModel.playerWin = true
//                        } else if viewModel.playerHandValue > 21 {
//                            dealerWin = true
//                            viewModel.cpuWin = true
//                        }
//                        viewModel.numberOfHitsRemaining = 0 // Disable the "Hit" button when handValue is greater than 21
//                        viewModel.isCardHidden = false
//                    }
                
            }
            else if handValue == 21 && hand.count == 2{
                VStack {
                    Text("Blackjack!!!!!")
                        .foregroundColor(Color("BJGold"))
                        .font(.title)
                }.onAppear {
                        if viewModel.dealerHandValue == 21 && viewModel.playerHandValue < 21 {
                            viewModel.dealerWin = true
                        } else if viewModel.playerHandValue == 21 && viewModel.dealerHandValue < 21 {
                            viewModel.playerWin = true
                        }else if viewModel.playerHandValue == 21 && viewModel.dealerHandValue == 21 {
                            viewModel.noWinners = true
                        }
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
        .onAppear {
//                    if playerWin {
//                        viewModel.playerWin = true
//                    } else if dealerWin {
//                        viewModel.cpuWin = true
//                    } else if noWinner {
//                        viewModel.noWinners = true
//                    }
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

