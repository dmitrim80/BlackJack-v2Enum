//
//  CardView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct CardView: View {
    
    
    let card: BlackJackCardModel
    
    init(card: BlackJackCardModel) {
        self.card = card
    }
   // @Binding var playerCard: String
    var body: some View {
            VStack{
                Text(card.card.rawValue).background(Color.white)
                    .cornerRadius(5)
                    .font(.largeTitle)
                    .foregroundColor(
                        // Clubs & Spades characters
                        card.card.rawValue.contains("🂢") ||
                        card.card.rawValue.contains("🂢") ||
                        card.card.rawValue.contains("🂣") ||
                        card.card.rawValue.contains("🂤") ||
                        card.card.rawValue.contains("🂥") ||
                        card.card.rawValue.contains("🂦") ||
                        card.card.rawValue.contains("🂧") ||
                        card.card.rawValue.contains("🂨") ||
                        card.card.rawValue.contains("🂩") ||
                        card.card.rawValue.contains("🂪") ||
                        card.card.rawValue.contains("🂫") ||
                        card.card.rawValue.contains("🂭") ||
                        card.card.rawValue.contains("🂮") ||
                        card.card.rawValue.contains("🃑") ||
                        card.card.rawValue.contains("🃒") ||
                        card.card.rawValue.contains("🃓") ||
                        card.card.rawValue.contains("🃔") ||
                        card.card.rawValue.contains("🃕") ||
                        card.card.rawValue.contains("🃖") ||
                        card.card.rawValue.contains("🃗") ||
                        card.card.rawValue.contains("🃘") ||
                        card.card.rawValue.contains("🃙") ||
                        card.card.rawValue.contains("🃚") ||
                        card.card.rawValue.contains("🃛") ||
                        card.card.rawValue.contains("🃝") ||
                        card.card.rawValue.contains("🃞") ? .black : .red)
                    .background(Color.white)
                    .cornerRadius(5)
                    .fontWeight(.heavy)
                    .scaleEffect(4.5)
                    .padding(5)
                    .shadow(radius: 0.5)
                    .shadow(color: .black, radius: 30, x: 15, y: 15)
            
        }
    }
    
    func drawCard() -> some View {
        switch card.card {
        case .aceofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .aceofspades:
            return VStack{ Text(card.card.rawValue)}
        case .twoofspades:
            return VStack{ Text(card.card.rawValue)}
        case .threeofspades:
            return VStack{ Text(card.card.rawValue)}
        case .fourofspades:
            return VStack{ Text(card.card.rawValue)}
        case .fiveofspades:
            return VStack{ Text(card.card.rawValue)}
        case .sixofspades:
            return VStack{ Text(card.card.rawValue)}
        case .sevenofspades:
            return VStack{ Text(card.card.rawValue)}
        case .eightofspades:
            return VStack{ Text(card.card.rawValue)}
        case .nineofspades:
            return VStack{ Text(card.card.rawValue)}
        case .tenofspades:
            return VStack{ Text(card.card.rawValue)}
        case .jackofspades:
            return VStack{ Text(card.card.rawValue)}
        case .queenofspades:
            return VStack{ Text(card.card.rawValue)}
        case .kingofspades:
            return VStack{ Text(card.card.rawValue)}
        case .aceofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .twoofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .threeofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .fourofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .fiveofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .sixofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .sevenofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .eightofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .nineofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .tenofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .jackofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .queenofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .kingofhearts:
            return VStack{ Text(card.card.rawValue)}
        case .aceofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .twoofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .threeofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .fourofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .fiveofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .sixofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .sevenofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .eightofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .nineofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .tenofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .jackofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .queenofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .kingofdiamonds:
            return VStack{ Text(card.card.rawValue)}
        case .twoofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .threeofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .fourofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .fiveofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .sixofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .sevenofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .eightofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .nineofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .tenofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .jackofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .queenofclubs:
            return VStack{ Text(card.card.rawValue)}
        case .kingofclubs:
            return VStack{ Text(card.card.rawValue)}
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(BlackJackCardModel.Card.allCases, id: \.self) { number in
            ZStack {
                Color.green
                    .ignoresSafeArea()
                CardView(
                    card: BlackJackCardModel(
                        card: .aceofhearts
                    )
                )
                    .padding()
            }
        }
    }
}

