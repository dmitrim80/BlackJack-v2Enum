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
    @Published var showPreviousResults = false
    @Published var isCardHidden = true
    @Published var playerHandValue = 0
    @Published var cpuHandValue = 0
    @Published var showingResultView = false
    @Published var gameHistory: [GameResult] = []
    
    @Published var cpuHandVisibility: [Bool] = [true, true]
    @Published var playerHandVisibility: [Bool] = [true, true, true,true]
    
    let delayDuration: TimeInterval = 2.0
    
    let engine: BlackJackEngineModel = BlackJackEngineModel()
    private var resultMessage = ""
    private var deck:[BlackJackCardModel] = []
    private var previousResult: BlackJackEngineModel.Result?
    
    var numberOfHitsRemaining = 2 {
        didSet {
            updateHitButton()
        }
    }
    
    
    func updateCardVisibility(_ index: Int, isHidden: Bool) {
        if index >= 0 && index < cpuHandVisibility.count {
                    cpuHandVisibility[index] = isHidden
            }
        }
    
    func updateHitButton() {
        disableHit = numberOfHitsRemaining == 0
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
            cpuHandValue = engine.getScore(hand: cpuHand,hide2ndCard: isCardHidden)
            showingResultView = true
        case .didPressResults:
            return
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
        // Add a delay before starting the game
        playerHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
        DispatchQueue.main.asyncAfter(deadline: .now() + delayDuration) { [self] in
            // Flip the first card in the CPU hand after the delay
            withAnimation(.easeInOut(duration: 0.5)) {
                cpuHandVisibility[0] = false
            }
        }
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
        
        let gameResult = GameResult(
                gameNumber: gameHistory.count + 1, // Increment the game number for each new game
                playerHand: playerHand,
                cpuHand: cpuHand,
                playerHandValue: playerHandValue,
                cpuHandValue: cpuHandValue
            )

            gameHistory.append(gameResult)
        }
    }
    
    private func makeDeck() -> [BlackJackCardModel] {
        var deck: [BlackJackCardModel] = []

        for card in BlackJackCardModel.Card.allCases {
            deck.append(.init(card: card))
            }
        return deck
    }
    
    
    
    
    
