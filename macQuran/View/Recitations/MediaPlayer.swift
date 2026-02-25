//
//  MediaButtons.swift
//  macQuran
//
//  Created by mBilG on 04/07/2021.
//

import SwiftUI
import AVKit

struct MediaPlayer: View {
    @State var audioPlayer: AVAudioPlayer!
    //@Binding var audioPlaying: Bool
    var body: some View {
        
        HStack(spacing:30){
            Button(action:{}, label:{
                Image(systemName: "backward.end")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .font(.system(size: 5, weight: .thin))
            }).buttonStyle(PlainButtonStyle())
            Button(action:{
//                audioPlaying.toggle()
//                if audioPlaying == true {
//                    Sounds.playSounds(soundfile: "001", status: "play")
//                }else{
//                    Sounds.playSounds(soundfile: "001", status: "pause")
//                }
//                //print("\(audioPlaying)")
                
            }, label:{
                Image(systemName: "playpause")
                    .resizable()
                    .frame(width: 40, height: 30)
                    .font(.system(size: 5, weight: .thin))
            }).buttonStyle(PlainButtonStyle())
            Button(action:{}, label:{
                Image(systemName: "forward.end")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .font(.system(size: 5, weight: .thin))
            }).buttonStyle(PlainButtonStyle())
            
        }.padding()
    }
}
