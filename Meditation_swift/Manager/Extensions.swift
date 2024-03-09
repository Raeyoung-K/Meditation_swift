//
//  Extension.swift
//  Meditation_swift
//
//  Created by Raeyoung Kim on 2024-03-05.
//

import Foundation

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initializing DataComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }() // lazy initialization - not initilize it until it's used
    
    static let positional: DateComponentsFormatter = {
        print("Initializing DataComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }() // lazy initialization - not initilize it until it's used
}
