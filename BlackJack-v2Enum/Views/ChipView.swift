//
//  ButtonView.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//

import SwiftUI

struct ChipView: View {
    var body: some View {
        VStack{
            Circle()
                .fill(.black)
                .frame(width: 75,height: 75)
                .overlay(
                    Circle()
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .butt, dash: [19]))
                        .frame(width: 70,height: 70)
                        .overlay(
                        Circle()
                            .fill(.white)
                            .frame(width: 40,height: 40)
                        )
                        .overlay(
                            ZStack{
                                Circle()
                                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .butt, dash: [16]))
                                    .frame(width: 40,height: 40)
                                Text("100")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                            }
                                
                                
                        )
                            
                    
            )
                
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView()
    }
}
