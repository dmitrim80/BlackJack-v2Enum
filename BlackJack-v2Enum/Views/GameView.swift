//
//  GameView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/20/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: BlackJackViewModel
    var body: some View {
        ZStack{
            backgroundSet
            VStack{
                PlayerHandView(
                    hand: viewModel.cpuHand,
                    hide2ndCard: viewModel.isCardHidden
                ).padding()
                Spacer()
                PlayerHandView(
                    hand: viewModel.playerHand,
                    hide2ndCard: false
                ).padding()
            }.frame(width: 300,height: 450)
             //   .background()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(BlackJackViewModel())
    }
}
