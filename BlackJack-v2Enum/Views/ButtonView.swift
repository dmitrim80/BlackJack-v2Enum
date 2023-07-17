//
//  ButtonView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/12/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String = "hand.raised.fill"
    let color: String = "BGRed"
    let action: () -> Void
    var body: some View {
        Button(
            action: action,
            label: {
                ZStack{
                    Rectangle()
                        .frame(width: 102,height: 52)
                        .foregroundColor(Color("BJGold"))
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                    Rectangle()
                        .frame(width: 95,height: 47)
                        .foregroundColor(Color("BJRed"))
                        .cornerRadius(15)
                        .offset(y: 1)
                        .shadow(color: .gray, radius: 1, x: 0, y: -1)
                        .shadow(color: .black, radius: 3, x: 0, y: 1)
                    Image(systemName: title)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .shadow(color: .white, radius: 1, x: 0, y: 1)
                }
            })
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {})
    }
}
