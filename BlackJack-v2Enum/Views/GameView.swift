//
//  GameView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/20/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: BlackJackViewModel
    @State private var shouldWait = true
    var body: some View {
        NavigationView{
            ZStack{
                backgroundSet
                VStack{
                    HStack{
                        DeckView()
                    }.frame(maxWidth:.infinity, maxHeight:30,alignment:.topTrailing)
                    Spacer()
                    VStack(spacing:100){
                        PlayerHandView(
                            hand: viewModel.cpuHand,
                            hide2ndCard: true
                        )
                        PlayerHandView(
                            hand: viewModel.playerHand,
                            hide2ndCard: false
                        ).padding(100)
                        
                    }
                }.frame(maxWidth:.infinity, maxHeight:.infinity)
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    shouldWait = false // Update the state to indicate waiting is done
                    viewModel.performClickAction() // Call the click action
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(BlackJackViewModel())
    }
}
