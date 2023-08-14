//
//  BlackJackView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/7/23.
//

import SwiftUI

struct BlackJackView: View {
    @EnvironmentObject var viewModel: BlackJackViewModel
    @State private var showingResultView = false
    var body: some View {
        ZStack {
            backgroundSet
            tableLable
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    PlayerHandView(
                        hand: viewModel.dealerHand,
                        hide2ndCard: viewModel.isCardHidden
                    ).scaleEffect(0.8)
                    
                    ScoreView(
                        hand: viewModel.dealerHand,
                        hide2ndCard: viewModel.isCardHidden
                    )
                    .environmentObject(viewModel)
                }
                
                Spacer()
                
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        PlayerHandView(
                            hand: viewModel.playerHand,
                            hide2ndCard: false
                        ).scaleEffect(0.8)
                        
                        
                        ScoreView(
                            hand: viewModel.playerHand,
                            hide2ndCard: false
                        )
                        .environmentObject(viewModel)
                        
                    }.padding(.bottom,30)
                    
                }
                VStack{
                    
                    HStack(alignment:.bottom, spacing: 20){
                        ButtonView(action: {
                            viewModel.send(action: .didPressHit)})
                        ButtonView(action: {
                            viewModel.send(action:.didPressHold)
                            showingResultView = false
                            viewModel.numberOfHitsRemaining = 0
                        })
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
            Text("CPU Wins!\n CPU:\(viewModel.dealerHandValue)\n Player:\(viewModel.playerHandValue)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .frame(width: 200, height: 120)
                .background(.yellow)
                .opacity($viewModel.dealerWin.wrappedValue ? 1 : 0)
                .offset(y:-80)
            Text("Player Wins!\n CPU:\(viewModel.dealerHandValue)\n Player:\(viewModel.playerHandValue)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("BJGreen"))
                .frame(width: 200, height: 120)
                .background(.yellow)
                .opacity($viewModel.playerWin.wrappedValue ? 1 : 0)
                .offset(y:-80)
            Text("Push!\n CPU:\(viewModel.dealerHandValue)\n Player:\(viewModel.playerHandValue)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .frame(width: 200, height: 120)
                .background(.yellow)
                .opacity($viewModel.noWinners.wrappedValue ? 1 : 0)
                .offset(y:-80)
            
            
            
            
        }.sheet(isPresented: $showingResultView) {
            ResultView(viewModel: viewModel, isShowingResultView: $showingResultView) }
    }
}



var backgroundSet: some View {
//    RadialGradient(colors: [Color.yellow,Color.green,Color.black], center: .center, startRadius: 3, endRadius: 200)
//        .opacity(0.7)
    Color("BJDarkGreen")
        .ignoresSafeArea()
}


var tableLable: some View {
   ZStack{
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
       }.offset(y:-100)
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView().environmentObject(BlackJackViewModel())
    }
}

