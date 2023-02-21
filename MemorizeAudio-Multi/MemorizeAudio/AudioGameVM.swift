//
//  AudioGameVM.swift
//  MemorizeAudio
//
//  Created by ldy on 2/20/23.
//

import SwiftUI
import AVFoundation

//func makeCardContent(index: Int) -> String{
//    return "🪬"
//}

class AudioGameVM: ObservableObject {
//    var player: AVAudioPlayer? = nil
    typealias Card = AudioGameModel<AVAudioPlayer?>.Card
    private static var bundleAudios = ["bbc-birds-1.m4a",
                                 "bbc-birds-2.m4a",
                                 "scale-1.m4a","bbc-birds-1.m4a",
                                       "bbc-birds-2.m4a",
                                       "scale-1.m4a","bbc-birds-1.m4a",
                                       "bbc-birds-2.m4a",
                                       "scale-1.m4a","bbc-birds-1.m4a",
                                       "bbc-birds-2.m4a",
                                       "scale-1.m4a"]
    
    private static func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: fileName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            return try AVAudioPlayer(contentsOf: url)
        } catch {
            print("loadBundleAudio error", error)
        }
        return nil
    }
    
    private static func createMemoryGame() throws -> AudioGameModel<AVAudioPlayer?> {
        AudioGameModel<AVAudioPlayer?>(pairOfCards: 4) { pairIndex in
            AudioGameVM.loadBundleAudio(bundleAudios[pairIndex])
        }}
    
    @Published private var model = try! AudioGameVM.createMemoryGame()
    
    var cards: Array<Card>{
        model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
    
}
