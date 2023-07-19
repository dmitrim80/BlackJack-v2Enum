//
//  BlackJackModel.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/3/23.
//

import Foundation

struct BlackJackCard {
    let card: Cards
}

struct BlackJackGame {
    let result = getResult()
//    let previousResult = Result.previous(result)

    func checkResult() {
        switch result {
        case .cpu(let score):
            print("Player won! SCORE:\(score)")
        case .player(let score):
            print("CPU won! SCORE:\(score)")
        case .tie:
            print("It's a Tie!")
        case .previous:
            break
        }
    }

}
enum Result {
    case player(score: Int)
    case cpu(score: Int)
    case tie
    indirect case previous(Result)
}

func getRightAce(currentScore: Int, numAces: Int) -> Int {
    let maxBlackJackPoints = 21
    let delta = maxBlackJackPoints - currentScore
    
    let maxAceValue = 11
    let elevanAce = maxAceValue + (numAces - 1)
    
    if elevanAce <= delta {
        return elevanAce
    }
    return numAces
}

func getScore(hand: [BlackJackCard]) -> Int {
    var numAces = 0
    var score = 0
    
    for card in hand {
        if card.card.rawValue == "🂡" || card.card.rawValue == "🂱" || card.card.rawValue == "🃁" || card.card.rawValue == "🃑" {
            numAces += 1
        } else {
            score += card.card.value
        }
    }
    if numAces > 0 {
        score += getRightAce(currentScore: score,
            numAces: numAces)
    }
    return score
}

func getResult() -> Result {
    let playerScore = getScore(hand: playerHand)
    print("Score: \(playerScore)")
    let cpuScore = getScore(hand: cpuHand)
    print("Score: \(cpuScore)")
    
    if playerScore == cpuScore {
        return .tie
    } else if playerScore > cpuScore && playerScore <= 21 {
        return .player(score: playerScore)
    }
    
    return .cpu(score: cpuScore)
    
    
}



func makeDeck() -> [BlackJackCard] {
    var deck: [BlackJackCard] = []
    
    for card in Cards.allCases {
        deck.append(.init(card: card))
    }
    return deck
}

func playerHandCount(deck: inout [BlackJackCard]) {
    var cpuHand: [BlackJackCard] = []
    cpuHand.append(deck.removeLast())
    cpuHand.append(deck.removeLast())
    
    var playerHand: [BlackJackCard] = []
    playerHand.append(deck.removeLast())
    playerHand.append(deck.removeLast())
}






    





enum Cards: String, CaseIterable, CustomStringConvertible {
    case aceofspades = "🂡"
    case twoofspades = "🂢"
    case threeofspades = "🂣"
    case fourofspades = "🂤"
    case fiveofspades = "🂥"
    case sixofspades = "🂦"
    case sevenofspades = "🂧"
    case eightofspades = "🂨"
    case nineofspades = "🂩"
    case tenofspades = "🂪"
    case jackofspades = "🂫"
    case queenofspades = "🂭"
    case kingofspades = "🂮"
    
    case aceofhearts = "🂱"
    case twoofhearts = "🂲"
    case threeofhearts = "🂳"
    case fourofhearts = "🂴"
    case fiveofhearts = "🂵"
    case sixofhearts = "🂶"
    case sevenofhearts = "🂷"
    case eightofhearts = "🂸"
    case nineofhearts = "🂹"
    case tenofhearts = "🂺"
    case jackofhearts = "🂻"
    case queenofhearts = "🂽"
    case kingofhearts = "🂾"
    
    case aceofdiamonds = "🃁"
    case twoofdiamonds = "🃂"
    case threeofdiamonds = "🃃"
    case fourofdiamonds = "🃄"
    case fiveofdiamonds = "🃅"
    case sixofdiamonds = "🃆"
    case sevenofdiamonds = "🃇"
    case eightofdiamonds = "🃈"
    case nineofdiamonds = "🃉"
    case tenofdiamonds = "🃊"
    case jackofdiamonds = "🃋"
    case queenofdiamonds = "🃍"
    case kingofdiamonds = "🃎"
    
    case aceofclubs = "🃑"
    case twoofclubs = "🃒"
    case threeofclubs = "🃓"
    case fourofclubs = "🃔"
    case fiveofclubs = "🃕"
    case sixofclubs = "🃖"
    case sevenofclubs = "🃗"
    case eightofclubs = "🃘"
    case nineofclubs = "🃙"
    case tenofclubs = "🃚"
    case jackofclubs = "🃛"
    case queenofclubs = "🃝"
    case kingofclubs = "🃞"
    
    var description: String {
        self.rawValue
    }
    var value: Int {
        switch self {
        case .aceofclubs, .aceofhearts, .aceofspades, .aceofdiamonds:
            return 1
        case .twoofclubs, .twoofhearts, .twoofspades, .twoofdiamonds:
            return 2
        case .threeofclubs, .threeofhearts, .threeofspades, .threeofdiamonds:
            return 3
        case .fourofclubs, .fourofhearts, .fourofspades, .fourofdiamonds:
            return 4
        case .fiveofclubs, .fiveofhearts, .fiveofspades, .fiveofdiamonds:
            return 5
        case .sixofclubs, .sixofhearts, .sixofspades, .sixofdiamonds:
            return 6
        case .sevenofclubs, .sevenofhearts, .sevenofspades, .sevenofdiamonds:
            return 7
        case .eightofclubs, .eightofhearts, .eightofspades, .eightofdiamonds:
            return 8
        case .nineofclubs, .nineofhearts, .nineofspades, .nineofdiamonds:
            return 9
        case .tenofclubs, .tenofhearts, .tenofspades, .tenofdiamonds,
                .jackofclubs, .jackofhearts, .jackofspades, .jackofdiamonds,
                .queenofclubs, .queenofhearts, .queenofspades, .queenofdiamonds,
                .kingofclubs, .kingofhearts, .kingofspades, .kingofdiamonds:
            return 10
        }
    }
}

