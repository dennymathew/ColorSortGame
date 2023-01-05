//
//  SizeScale.swift
//  ColorSortGame
//
//  Created by Denny on 05/01/23.
//

import SwiftUI

struct SizeScale {
    
    private static let screenHeight: CGFloat = {
        UIScreen.main.bounds.height
    }()
    
    static let regularSize: CGFloat = {
        screenHeight/6
    }()
    
    static let highlightedSize: CGFloat = {
        regularSize * 1.3
    }()
    
    static let spacing: CGFloat = {
        regularSize/2
    }()
    
    static let shadowRadius: CGFloat = 10
    
    static let initialPosition: CGPoint = .init(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 50
    )
}
