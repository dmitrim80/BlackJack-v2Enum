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
        HStack{
            Rectangle()
            HStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.background()
        }.background(.black)
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: BlackJackViewModel())
    }
}
