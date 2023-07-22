//
//  PlayerHandView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct PlayerHandView: View {
    @ObservedObject private var viewModel = BlackJackViewModel()
    let hand: [BlackJackCardModel]
    let hide2ndCard: Bool
    
    var body: some View {
        ZStack {
            // Iterate through the hand to display the cards
            ForEach(0..<hand.count, id: \.self) { index in
                // If it's the second card and hide2ndCard is true, show it as Hidden
                if hide2ndCard && index == 1 {
                    if viewModel.cpuHandVisibility[1] {
                        HiddenCardView()
                            .offset(x: CGFloat(index * 120) - 50, y: -20)
                            .scaleEffect(1.2)
                            .opacity(1)
                            .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 0.5))
                    } else {
                        // Otherwise, show the second card with CardView
                        CardView(width: 100, height: 150, card: hand[index])
                            .offset(x: CGFloat(index * 30) - 50, y: 0)
                            .scaleEffect(1.2)
                            .opacity(1)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 0.5))
                    }
                } else {
                    // Show the other cards with CardView
                    CardView(width: 100, height: 150, card: hand[index])
                        .offset(x: CGFloat(index * 40) - 50, y: 0)
                        .scaleEffect(1.2)
                        .opacity(1)
                        .rotation3DEffect(.degrees(1), axis: (x: 0, y: 1, z: 0))
                        .animation(.easeInOut(duration: 0.5))
                }
            }
        }
        .onAppear {
            // Show first card hidden for 2 seconds, then flip it
            DispatchQueue.main.asyncAfter(deadline: .now() + viewModel.delayDuration) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    viewModel.updateCardVisibility(0, isHidden: false)
                }
            }
            
            // Show second card hidden for 2 seconds, then flip it (only if hide2ndCard is false)
            if !hide2ndCard {
                DispatchQueue.main.asyncAfter(deadline: .now() + viewModel.delayDuration * 2) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.updateCardVisibility(1, isHidden: false)
                    }
                }
            }
        }
    }
}


struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PlayerHandView(hand: Array(BlackJackCardModel.sample.prefix(upTo: 2)), hide2ndCard: true).frame(width: 200,height: 200,alignment: .top)
                .listRowInsets(EdgeInsets())
            
               // .rotationEffect(.degrees(180))
            Divider()
            PlayerHandView(hand: Array(BlackJackCardModel.sample.prefix(upTo: 4)), hide2ndCard: false).frame(width: 200,height: 200,alignment: .bottom)
                .listRowInsets(EdgeInsets())
        }.frame(width: 200,height: 400)
    }
}
