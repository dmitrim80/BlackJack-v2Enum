//
//  BlackJackModel.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/3/23.
//

import Foundation

struct BlackJackEngineModel{
    indirect enum Result {
        case player(score: Int)
        case cpu(score: Int)
        case tie
        case previous(Result)
    }
    
    func getRightAceValue(currentScore: Int, numAces: Int) -> Int {
        let delta = 21 - currentScore
        
        let elevenAce =  11 + (numAces - 1)
        if elevenAce <= delta {
            return elevenAce
        }
        
        return numAces
    }
    
    func getScore(hand: [BlackJackCardModel], hide2ndCard: Bool) -> Int {
        if hide2ndCard {
            if (hand[0].card.value == 10 && hand[1].card.rawValue == "🂡" ) || (hand[0].card.value == 10 && hand[1].card.rawValue == "🂱") || (hand[0].card.value == 10 && hand[1].card.rawValue == "🃁") || (hand[0].card.value == 10 && hand[1].card.rawValue == "🃑") ||
                (hand[1].card.value == 10 && hand[0].card.rawValue == "🂡" ) || (hand[1].card.value == 10 && hand[0].card.rawValue == "🂱") || (hand[1].card.value == 10 && hand[0].card.rawValue == "🃁") || (hand[1].card.value == 10 && hand[0].card.rawValue == "🃑") {
                return 21
            } else {
                return hand.first?.card.value ?? 0
            }
        } else {
            var score = 0
            var numAces = 0
            
            for card in hand {
                if card.card.rawValue == "🂡" || card.card.rawValue == "🂱" || card.card.rawValue == "🃁" || card.card.rawValue == "🃑" {
                    numAces += 1
                } else {
                    score += card.card.value
                }
            }
            
            if numAces > 0 {
                score += getRightAceValue(
                    currentScore: score,
                    numAces: numAces
                )
            }
            
            return score
        }
    }
        
    func getResult(
        _ playerHand: [BlackJackCardModel],
        _ cpuHand: [BlackJackCardModel]
    ) -> Result{
        let playerScore = getScore(hand: playerHand, hide2ndCard: false)
        let cpuScore = getScore(hand: cpuHand, hide2ndCard: false)
        if playerScore == cpuScore {
            return .tie
        }else if playerScore > cpuScore && playerScore <= 21 {
            return .player(score: playerScore)
        }
        return .cpu(score: cpuScore)
    }
}
