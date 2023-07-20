//
//  ResultView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/19/23.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: BlackJackViewModel
    
    var body: some View {
        let cpuScore = viewModel.cpuHandValue
        let playerScore = viewModel.playerHandValue
        ZStack{
            backgroundSet
            VStack{
                Button(action:{ viewModel.showingResultView = false}) {Image(systemName: "x.circle")
                        .scaleEffect(2)
                        .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .topTrailing)
                        .padding(20)
                        .foregroundColor(.red)
                }
            }
            VStack{
                
                Text("Game Results:\nCPU: \(cpuScore)\nPlayer: \(playerScore)")
                    .frame(width: 250,height: 200, alignment: .topLeading)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(maxWidth: 0, maxHeight: 750,alignment:.top )
                
                Text("Game History").font(.title)
                
                List(viewModel.gameHistory, id: \.gameNumber) { gameResult in
                    VStack(alignment: .leading) {
                        Text("Game \(gameResult.gameNumber)")
                        Text("Player Hand: \(handToString(gameResult.playerHand)), Value: \(gameResult.playerHandValue)")
                        Text("CPU Hand: \(handToString(gameResult.cpuHand)), Value: \(gameResult.cpuHandValue)")
                    }
                }
            }
            
            
        }
    }
    private func handToString(_ hand: [BlackJackCardModel]) -> String {
        // Convert the hand array to a string representation
        // For example, joining card values with commas.
        return hand.map { "\($0.card.value)" }.joined(separator: ", ")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: BlackJackViewModel())
    }
}

