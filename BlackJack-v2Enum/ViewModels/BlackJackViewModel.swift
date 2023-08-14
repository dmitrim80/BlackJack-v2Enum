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
    @Published var dealerHand: [BlackJackCardModel] = []
    @Published var disableHit = false
    @Published var showPreviousResults = false
    @Published var isCardHidden = true
    @Published var playerHandValue = 0
    @Published var dealerHandValue = 0
    @Published var showingResultView = false
    @Published var gameHistory: [GameResult] = []
    @Published var dealerWin: Bool = false
    @Published var playerWin: Bool = false
    @Published var noWinners: Bool = false
    
    @Published var dealerHandVisibility: [Bool] = [true, true]
    @Published var playerHandVisibility: [Bool] = [true, true, true,true]
    
    let delayDuration: TimeInterval = 1.0
    
    let engine: BlackJackEngineModel = BlackJackEngineModel()
    private var resultMessage = ""
    private var deck:[BlackJackCardModel] = []
    private var previousResult: BlackJackEngineModel.Result?
    
    var numberOfHitsRemaining = 10 {
        didSet {
            updateHitButton()
        }
    }
    
    func performClickAction() {
        
        }
    
    func updateCardVisibility(_ index: Int, isHidden: Bool) {
        if index >= 0 && index < dealerHandVisibility.count {
                    dealerHandVisibility[index] = isHidden
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
                dealerHandValue = engine.getScore(hand: dealerHand,hide2ndCard: isCardHidden)
                if playerHandValue > 21 {
                    dealerWin = true
                }
            }
        case .didPressHold:
            isCardHidden = false
            hold()
            playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
            dealerHandValue = engine.getScore(hand: dealerHand,hide2ndCard: isCardHidden)
            
            while dealerHandValue <= playerHandValue && dealerHandValue < 17 {
                dealerHand.append(deck.removeLast())
                playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
                dealerHandValue = engine.getScore(hand: dealerHand,hide2ndCard: isCardHidden)
            }
            if playerHandValue > dealerHandValue && playerHandValue <= 21 || playerHandValue <= 21 && dealerHandValue > 21 {
                playerWin = true
                dealerWin = false
                noWinners = false
            } else if dealerHandValue > playerHandValue && dealerHandValue <= 21 || dealerHandValue <= 21 && playerHandValue > 21  {
                dealerWin = true
                playerWin = false
                noWinners = false
            } else {
                dealerWin = false
                playerWin = false
                noWinners = true
            }
            
           // showingResultView = true
        case .didPressResults:
            return
        case .didPressNewGame:
            startGame()
            playerHandValue = engine.getScore(hand: playerHand,hide2ndCard: isCardHidden)
            dealerHandValue = engine.getScore(hand: dealerHand,hide2ndCard: isCardHidden)
            if playerHandValue == 21 {
                playerWin = true
            }
            if dealerHandValue == 21 {
                dealerWin = true
            }
        }
    }
    
    init() {
        startGame()
    }
    
    private func startGame() {
        playerWin = false
        dealerWin = false
        noWinners = false
        playerHandValue = 0
        dealerHandValue = 0
        isCardHidden = true
        playerHand.removeAll()
        dealerHand.removeAll()
        deck = makeDeck()
        deck.shuffle()
        numberOfHitsRemaining = 10
        playerHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
        dealerHand.append(deck.removeLast())
        dealerHand.append(deck.removeLast())
        DispatchQueue.main.asyncAfter(deadline: .now() + delayDuration) { [self] in
            // Flip the first card in the CPU hand after the delay
            withAnimation(.easeInOut(duration: 1)) {
                dealerHandVisibility[0] = false
            }
        }
    }
    
    private func hold() {
        
        let dealerHandValue = engine.getScore(hand: dealerHand, hide2ndCard: false)
        let playerHandValue = engine.getScore(hand: playerHand, hide2ndCard: false)
        if playerHandValue > dealerHandValue {
            
        }
        let result = engine.getResult(playerHand, dealerHand)
        previousResult = .previous(result)
        switch result {
        case .player(let score):
            resultMessage = "You won!, Score: \(score)"
        case .dealer(let score):
            resultMessage = "Dealer won!, Score: \(score)"
        case .tie:
            resultMessage = "This was a Tie!"
        default:
            break
        }
        
        let gameResult = GameResult(
                gameNumber: gameHistory.count + 1, // Increment the game number for each new game
                playerHand: playerHand,
                dealerHand: dealerHand,
                playerHandValue: playerHandValue,
                dealerHandValue: dealerHandValue
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
    
    
    
    
    
