//
//  AudioManager.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-04.
//

import Foundation
import AVKit

final class AudioManager : ObservableObject {
    
    //static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    @Published private(set) var isLooping: Bool = false
    
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    func pausePlayer() {
        guard let player = player else {
            print("No instance of audio player")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func stopPlayer() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0   // if numberOfLoops = -1, then infinite loop
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }

}
