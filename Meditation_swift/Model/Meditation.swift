//
//  MeditationViewModel.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-05.
//

import Foundation

//final class MeditationViewModel: ObservableObject {
//    private(set) var meditation: Meditation
//    
//    init(meditation: Meditation) {
//        self.meditation = meditation
//    }
//}

struct Meditation : Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let koreanHeartSutra = Meditation(title: "10 Minute Meditation with Heart Sutra (Korean Version)", description: "Clear your mind and slumber into nothingness. Feel yourself with a nature.", duration: 618, track: "heart_sutra_korean", image: "meditation")
    
    
}

extension Meditation {
    static let meditationList : [Meditation] = [
        Meditation(title: "3 Minute Meditation with the sound of nature", description: "Take three minutes to meditate peacefully, focusing on nature.", duration: 203, track: "sound_of_nature", image: "nature"),
        Meditation(title: "5 Minute Meditation with piano", description: "Refresh your mind while listening to the sound of the piano songs", duration: 306, track: "piano", image: "piano"),
        Meditation(title: "10 Minute Meditation with Heart Sutra (Korean Version)", description: "Clear your mind and slumber into nothingness. Feel yourself with a nature.", duration: 618, track: "heart_sutra_korean", image: "meditation")
    ]
}
