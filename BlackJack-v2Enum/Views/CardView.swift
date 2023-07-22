    //
    //  CardView.swift
    //  BlackJack-v2Enum
    //
    //  Created by Dmitri Morozov on 7/8/23.
    //

import SwiftUI
    
struct CardView: View {
    let width: CGFloat
    let height: CGFloat
    let card: BlackJackCardModel
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            if isFlipped {
                HiddenCardView()
            } else {
                VStack {
                    Text(card.card.rawValue)
                        .background(Color.white)
                        .cornerRadius(5)
                        .font(.largeTitle)
                        .foregroundColor(
                            // Clubs & Spades characters black color
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
        }.frame(width: width, height: height)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isFlipped.toggle()
                }
            }.rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(.default)
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(BlackJackCardModel.Card.allCases, id: \.self) { card in
            ZStack {
                Color.green
                    .ignoresSafeArea()
                CardView(width: 100, height: 150, card: BlackJackCardModel(card: card))
                    .frame(width: 100, height: 150)
                    .padding()
            }
            }
        }
    }








