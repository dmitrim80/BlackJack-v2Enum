//
//  DealCardView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 8/9/23.
//

import SwiftUI

struct DealCardView: View {
    var CardFlipped: String = "🂠"
    var Card2: String = "🃑"
    @State private var stage1: Bool = false
    @State private var stage2: Bool = false
    @State private var animate1: Bool = false
    var body: some View {
        ZStack {
            Text(CardFlipped)
                .background(.indigo)
                .foregroundColor(.yellow)
                .cornerRadius(5)
                .font(.largeTitle)
                .cornerRadius(5)
                .fontWeight(.heavy)
                .scaleEffect(4.5)
                .padding(5)
                .shadow(radius: 0.5)
                .shadow(color: .black, radius: 5, x: 5, y: 5)
                .offset(x: animate1 ?  0 : 380, y: animate1 ? 0 : -130)
                .rotationEffect(.degrees(animate1 ? 0 : -50))
                .rotation3DEffect(.degrees(stage1 ? 10 : 0), axis: (x: 1, y: 10, z: 0))
            
            
        Button("Here") {
            withAnimation(.easeInOut(duration: 2)){
                stage1.toggle()
            }
        }.offset(y:300)
            .foregroundColor(.red)
        }.onAppear(){
            withAnimation(.easeInOut(duration: 1)){
                animate1.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                Text(CardFlipped)
                    .background(.red)
                    .foregroundColor(.yellow)
                    .cornerRadius(5)
                    .font(.largeTitle)
                    .cornerRadius(5)
                    .fontWeight(.heavy)
                    .scaleEffect(4.5)
                    .padding(5)
                    .shadow(radius: 0.5)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .rotation3DEffect(.degrees(stage1 ? 0 : 90), axis: (x: 1, y: 1, z: 0))
            }
            
        }
    }
}

struct DealCardView_Previews: PreviewProvider {
    static var previews: some View {
        DealCardView()
    }
}

