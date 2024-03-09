//
//  TenPlayerView.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-05.
//

import SwiftUI

struct TenPlayerView: View {
    
//    var meditationViewModel: MeditationViewModel
    var meditation: Meditation
    
    @Environment(\.dismiss) private var dismiss
    @State private var value : Double = 0.0
   
    
    var body: some View {
        ZStack {
            // MARK: Backgroud Image
//            Image(meditationViewModel.meditation.image)
            Image(meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            // MARK: Blur View
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            
            VStack (spacing: 32) {
                
                //MARK: Dismiss Button
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                } // HStack
            
                // MARK: Title
//                Text(meditationViewModel.meditation.title)
                Text(meditation.title)
                    .font(.system(size: 32))
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                VStack (spacing: 5) {
                    // MARK: Playback Timeline
                    Slider(value: $value, in: 0...60)
                        .tint(.white)
                    
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text("10:18")
                    }
                    .font(.caption)
                    .foregroundStyle(Color.white)
                    
                    HStack {
                        
                        // MARK: Repeat Button
                        PlaybackControlButton(systemName: "repeat") {
                            
                        }
                        
                        Spacer()
                        
                        // MARK: Backward Button
                        PlaybackControlButton(systemName: "gobackward.10") {
                            
                        }
                        
                        Spacer()
                        
                        // MARK: Play/Pause Button
                        PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                            
                        }
                        
                        Spacer()
                        
                        // MARK: Forward Button
                        PlaybackControlButton(systemName: "goforward.10") {
                            
                        }
                        
                        Spacer()
                        
                        // MARK: Stop Button
                        PlaybackControlButton(systemName: "stop.fill") {
                            
                        }
                    } // HStack
                    
                } // VStack
                
            } // VStack
            .padding(20)
        } // ZStack
    }
}

struct TenPlayerView_Previews: PreviewProvider {
    static let meditation = Meditation.koreanHeartSutra
    
    static var previews: some View {
        TenPlayerView(meditation: meditation)
    }
}

//#Preview {
//    let meditationVM = MeditationViewModel(meditation: Meditation.koreanHeartSutra)
//    
//    TenPlayerView(meditationViewModel: meditationVM)
//}
