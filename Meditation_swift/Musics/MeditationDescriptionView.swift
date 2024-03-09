//
//  HomeView.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-03.
//

import SwiftUI

struct MeditationDescriptionView: View {
    
    //@State var isPaused = true
    
    //@StateObject var meditationViewModel: MeditationViewModel
    var meditation: Meditation
    @State var showPlayer = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //MARK: Image (1/3 of the screen)
//            Image(meditationViewModel.meditation.image)
            Image(meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3) // screen proportion
            
            // MARK: Background (2/3 of the screen)
            ZStack {
                Color(red: 50/255, green: 50/255, blue: 50/255)
                
                VStack (alignment: .leading, spacing: 24) {
                    
                    VStack (alignment: .leading, spacing: 8) {
                        //Text("Heart Sutra - Korean ver")
                        
//                        Text(DateComponentsFormatter.abbreviated.string(from: meditationViewModel.meditation.duration) ?? meditationViewModel.meditation.duration.formatted() + "S")
                        Text(DateComponentsFormatter.abbreviated.string(from: meditation.duration) ?? meditation.duration.formatted() + "S")
                        
                    } // VStack
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    // MARK: Title
//                    Text(meditationViewModel.meditation.title)
                    Text(meditation.title)
                    
                    // MARK: Button
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.white)
                            .clipShape(.capsule)
                    }
                    
                    // MARK: Description
//                    Text(meditationViewModel.meditation.description)
                    Text(meditation.description)
                    
                    Spacer()
                } // VStack
                .foregroundStyle(Color.white)
                .padding(20)
                
            } // ZStack
            .frame(height: UIScreen.main.bounds.height * 2 / 3) // screen proportion

        } // VStack
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
//            TenPlayerView(meditationViewModel: meditationViewModel)
            MeditationPlayerView(meditation: meditation)
        }
        
    }//body
}

struct MeditationDescriptionView_Previews: PreviewProvider {
    static let meditation = Meditation.koreanHeartSutra
    
    static var previews: some View {
        MeditationDescriptionView(meditation: meditation)
            .environmentObject(AudioManager())
    }
}

//#Preview {
//    let meditationVM = MeditationViewModel(meditation: Meditation.koreanHeartSutra)
//    TenDescriptionView(meditationViewModel: meditationVM)
//}





//        ZStack {
//            Image("meditation")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//
//            VStack {
//                Spacer()
//
//                Text("반야심경")
//                    .foregroundStyle(Color.white)
//                    .font(.largeTitle)
//                    .bold()
//                Spacer()
//
//                HStack(spacing: 30){
//                    Image(systemName: "gobackward.10")
//                        .foregroundColor(Color.white)
//                        .font(.title)
//                    Button {
//                        isPaused = !isPaused
//                        isPaused ?
//                            AudioManager.shared.pausePlayer(track: "test")
//                        :
//                            AudioManager.shared.startPlayer(track: "test")
//                    } label: {
//                        isPaused ?
//                            Image(systemName: "play.circle")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 60))
//                        :
//                            Image(systemName: "pause.circle")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 60))
//                    }
//
//                    Image(systemName: "goforward.10")
//                        .foregroundColor(Color.white)
//                        .font(.title)
//
//                } // HStack
//
//                Spacer()
//
//            } // VStack
//
//
//        } // ZStack
