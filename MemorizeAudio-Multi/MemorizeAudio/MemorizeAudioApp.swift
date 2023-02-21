//
//  MemorizeAudioApp.swift
//  MemorizeAudio
//
//  Created by ldy on 2/18/23.
//

import SwiftUI

@main
struct MemorizeAudioApp: App {
    let game = AudioGameVM()
    var body: some Scene {
        WindowGroup {
            AudioGameView(viewModel: game)
        }
    }
}
