//
//  BlackJack_v2EnumApp.swift
//  BlackJack-v2Enum
//
//  Created by Dmitri Morozov on 7/3/23.
//

import SwiftUI

@main

struct BlackJack_v2EnumApp: App {
    @StateObject var viewModel: BlackJackViewModel = BlackJackViewModel()
    var body: some Scene {
        WindowGroup {
            BlackJackView()
                .environmentObject(viewModel)
        }
    }
}
