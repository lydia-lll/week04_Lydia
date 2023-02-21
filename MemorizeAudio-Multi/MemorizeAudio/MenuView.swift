//
//  MenuView.swift
//  MemorizeAudio
//
//  Created by ldy on 2/21/23.
//

import SwiftUI

struct MenuView: View {
    let game = AudioGameVM()
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: AudioGameView(viewModel: game)){
                    Text("Audio Memory Game")
                }
                NavigationLink(destination: PitchControlView()){
                    Text("Pitch & Speed Control")
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
