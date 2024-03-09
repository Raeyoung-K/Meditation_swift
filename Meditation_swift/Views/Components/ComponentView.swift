//
//  ComponentView.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-05.
//

import SwiftUI

struct ComponentView: View {

    var meditation : Meditation
    
    var body: some View {
        
        VStack {
            
            Image(meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height * 2 / 8)
            ZStack {
                
                Color(red: 50/255, green: 50/255, blue: 50/255)
                
                VStack (alignment: .leading, spacing: 8) {
                    Text(DateComponentsFormatter.abbreviated.string(from: meditation.duration) ?? meditation.duration.formatted() + "S")
                        .font(.subheadline)
                        .foregroundStyle(Color.white)
                        .opacity(0.75)
                    Text(meditation.title)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                    
                    
                } // VStack
                .padding(10)
                
            } // ZStack
            .frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height * 1 / 8)
            
        } // VStack
        .clipShape(.rect(cornerRadius: 30))
        
    
    }
}

struct ComponentView_Previews : PreviewProvider {
    static let meditation = Meditation.koreanHeartSutra
    
    static var previews: some View {
        ComponentView(meditation: meditation)
    }
}


//#Preview {
//    let meditation = Meditation.koreanHeartSutra
//    ComponentView(meditation: meditation)
//}
