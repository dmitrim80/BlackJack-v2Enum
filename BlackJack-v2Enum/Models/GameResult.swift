//
//  GameResult.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/20/23.
//

import Foundation
struct GameResult {
    let gameNumber: Int
    let playerHand: [BlackJackCardModel]
    let dealerHand: [BlackJackCardModel]
    let playerHandValue: Int
    let dealerHandValue: Int
}
