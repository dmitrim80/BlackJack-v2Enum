//
//  BlackJackView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/7/23.
//

import SwiftUI

struct BlackJackView: View {
    @EnvironmentObject var viewModel: BlackJackViewModel
    
    var body: some View {
        ZStack {
            backgroundSet
            VStack {
                Spacer()
                HStack {
                    PlayerHandView(
                        hand: viewModel.cpuHand,
                        hide2ndCard: viewModel.isCardHidden
                    ).padding(10)
                    
                    ScoreView(
                        hand: viewModel.cpuHand,
                        hide2ndCard: viewModel.isCardHidden
                    )
                        .padding(.leading,100)
                        .environmentObject(viewModel)
                    
                }
                
                
                
                Spacer()
                
                tableLable
                Spacer()
                VStack {
                    HStack {
                        
                        PlayerHandView(
                            hand: viewModel.playerHand,
                            hide2ndCard: false
                        ).padding(20)
                        
                        ScoreView(
                            hand: viewModel.playerHand,
                            hide2ndCard: false
                        )
                            .padding(.leading,100)
                            .environmentObject(viewModel)
                        
                    }
                    
                }
                VStack{
                    
                    HStack(alignment:.bottom, spacing: 20){
                        ButtonView(action: {
                            viewModel.send(action: .didPressHit)})
                        ButtonView(action: {viewModel.send(action: .didPressHold)})
                        ButtonView(action: {viewModel.send(action: .didPressNewGame)})
                    }
                    HStack(spacing: 50) {
                        Text("Hit")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Hold")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("New Game")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }.padding(.top, 50)
                HStack{
                    ChipView()
                    ChipView()
                    ChipView()
                    ChipView()
                }
            }
        }
    }
}

var backgroundSet: some View {
//    RadialGradient(colors: [Color.yellow,Color.green,Color.black], center: .center, startRadius: 3, endRadius: 200)
//        .opacity(0.7)
    Color("BJDarkGreen")
        .ignoresSafeArea()
}

var tableLable: some View {
    VStack{
        let locationTableText:String = "LONDON"
        Text(locationTableText)
            .foregroundColor(.yellow)
            .font(.largeTitle)
        Text("BLACKJACK Pays 3 to 2")
            .bold()
            .foregroundColor(.white)
            .font(.title)
        Text("Dealer must stand on soft 17")
            .foregroundColor(.white)
            .font(.title2)
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView().environmentObject(BlackJackViewModel())
    }
}
