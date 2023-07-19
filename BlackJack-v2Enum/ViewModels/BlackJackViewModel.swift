//
//  BlackJackViewModel.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/8/23.
//
import SwiftUI

import Foundation

class BlackJackViewModel: ObservableObject {
    @Published var playerHand: [BlackJackCardModel] = []
    @Published var cpuHand: [BlackJackCardModel] = []
    @Published private var disableHit = false
    @Published var showResult = false
    @Published var showPreviousResults = false
    @Published var isCardHidden = true
    @Published var playerHandValue = 0
    @Published var cpuHandValue = 0
    
    let engine: BlackJackEngineModel = BlackJackEngineModel()
    private var resultMessage = ""
    private var hitColor = Color.black
    private var hitOpacity = 1.0
    private var deck:[BlackJackCardModel] = []
    private var previousResult: BlackJackEngineModel.Result?
    
    var numberOfHitsRemaining = 2 {
        didSet {
            updateHitButton()
        }
    }
    
    func updateHitButton() {
        disableHit = numberOfHitsRemaining == 0
        hitColor = numberOfHitsRemaining == 0 ? .gray : .black
        hitOpacity = numberOfHitsRemaining == 0 ? 0.7 : 1.0
    }
    
    enum Action {
        case didPressHit
        case didPressHold
        case didPressResults
        case didPressNewGame
    }
    func send(action: Action) {
        switch action {
        case .didPressHit:
            if numberOfHitsRemaining > 0 {
                playerHand.append(deck.removeLast())
                numberOfHitsRemaining -= 1
                playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
            
            }
        case .didPressHold:
            isCardHidden = false
            hold()
            playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
            //showResult = true
        case .didPressResults:
            showPreviousResults = true
        case .didPressNewGame:
            startGame()
            playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
        }
    }
    
    init() {
        startGame()
    }
    
    private func startGame() {
        playerHandValue = 0
        cpuHandValue = 0
        isCardHidden = true
        deck = makeDeck()
        deck.shuffle()
        playerHand.removeAll()
        cpuHand.removeAll()
        numberOfHitsRemaining = 2
        playerHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
    }
    
    private func hold() {
        
        let cpuHandValue = engine.getScore(hand: cpuHand, hide2ndCard: false)
        let playerHandValue = engine.getScore(hand: playerHand, hide2ndCard: false)
        if playerHandValue > cpuHandValue {
            
        }
        let result = engine.getResult(playerHand, cpuHand)
        previousResult = .previous(result)
        switch result {
        case .player(let score):
            resultMessage = "You won!, Score: \(score)"
        case .cpu(let score):
            resultMessage = "CPU won!, Score: \(score)"
        case .tie:
            resultMessage = "This was a Tie!"
        default:
            break
        }
    }
    
    private func makeDeck() -> [BlackJackCardModel] {
        var deck: [BlackJackCardModel] = []

        for card in BlackJackCardModel.Card.allCases {
            deck.append(.init(card: card))
            }
        return deck
    }
    
    
    
}
