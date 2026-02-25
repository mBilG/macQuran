//
//  AudioPlayerModel.swift
//  macQuran
//
//  Created by mBilG on 04/07/2021.
//

import AVFoundation

 class Sounds {

   static var audioPlayer:AVAudioPlayer?

    static func playSounds(soundfile: String, status: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{

               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.prepareToPlay()
            if status == "play"{
                audioPlayer?.play()
            }
            else{
                audioPlayer?.pause()
            }
           }catch {
               print("Error")
           }
       }
    }
 }
