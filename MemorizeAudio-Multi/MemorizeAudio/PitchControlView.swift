//
//  PitchControlView.swift
//  MemorizeAudio
//
//  Created by ldy on 2/21/23.
//

import SwiftUI
import AVKit

let engine = AVAudioEngine()
let speedControl = AVAudioUnitVarispeed()
let pitchControl = AVAudioUnitTimePitch()

let urlSounds = [
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3",
]

func play(_ url: URL) throws {
    // 1: load the file
    let file = try AVAudioFile(forReading: url)

    // 2: create the audio player
    let audioPlayer = AVAudioPlayerNode()

    // 3: connect the components to our playback engine
    engine.attach(audioPlayer)
    engine.attach(pitchControl)
    engine.attach(speedControl)

    // 4: arrange the parts so that output from one is input to another
    engine.connect(audioPlayer, to: speedControl, format: nil)
    engine.connect(speedControl, to: pitchControl, format: nil)
    engine.connect(pitchControl, to: engine.mainMixerNode, format: nil)

    // 5: prepare the player to play its file from the beginning
    audioPlayer.scheduleFile(file, at: nil)

    // 6: start the engine and player
    try engine.start()
    audioPlayer.play()
}

//override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    pitchControl.pitch += 50
//    speedControl.rate += 0.1
//}

struct PitchControlView: View {
    let shape = Circle()
    var body: some View {
        VStack{
            shape
                .fill(.orange)
                .onTapGesture {
                try? play(URL(string: urlSounds[0])!)
            }
            shape
                .fill(.pink)
                .onTapGesture {
                pitchControl.pitch += 50
                speedControl.rate += 0.1
            }
        }
    }
}

struct PitchControlView_Previews: PreviewProvider {
    static var previews: some View {
        PitchControlView()
    }
}

