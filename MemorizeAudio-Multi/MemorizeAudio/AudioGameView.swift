//
//  ContentView.swift
//  MemorizeAudio
//
//  Created by ldy on 2/18/23.
//

import SwiftUI
import AVFoundation

struct AudioGameView: View {
    
    @ObservedObject var viewModel: AudioGameVM
    @State private var player: AVAudioPlayer? = nil
    
    //    let columns = [GridItem(.adaptive(minimum: 80))]
    //    let pairOfCards: Int = 4
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(viewModel.cards){ card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.choose(card)
                            card.content?.play()
                        }
                }
            }
        }
        
    }
    
    struct CardView: View{
        var card: AudioGameVM.Card
        var body: some View{
            let shape = Circle()
            ZStack{
                if card.isFaceUp{
                    shape.fill(.orange).frame(width: 60)
                    Text("🪬").font(.largeTitle)
                }else if card.isMatched{
                    shape.opacity(0)
                }else{
                    shape.fill(.blue).frame(width: 60)
                    Text("🪬").font(.largeTitle)
                }
                
            }
        }
    }
    
    struct AudioGameView_Previews: PreviewProvider {
        static var previews: some View {
            let game = AudioGameVM()
            AudioGameView(viewModel: game)
        }
    }
}
