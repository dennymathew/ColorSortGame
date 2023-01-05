//
//  ToyViewModel.swift
//  ColorSortGame
//
//  Created by Denny on 04/01/23.
//

import SwiftUI

class ToyViewModel: ObservableObject {
    
    // MARK: - Gesture properties
    @Published var currentToy: Toy?
    @Published var currentPosition: CGPoint = SizeScale.initialPosition
    @Published var highlightedId: Int?
    @Published var draggableToyOpaciy: CGFloat = 1.0
    @Published var isGameOver: Bool = false
    private(set) var attempts: Int = -2
    
    // MARK: - Coordinates
    private var frames: [Int: CGRect] = [:]
    
    // MARK: - Objects in the screen
    var toyContainers: [Toy] = Array(Toy.all.shuffled().prefix(6))
    private lazy var toys: [Toy] = Array(toyContainers.shuffled().prefix(3))
    
    // MARK: - Game lifecycle
    func setUpGame() {
        currentToy = toys.popLast()
    }
    
    func nextRound() {
        currentToy = toys.popLast()
        
        if currentToy == nil {
            gameOver()
        } else {
            prepareObjects()
        }
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func prepareObjects() {
        withAnimation {
            toyContainers.shuffle()
        }
        
        withAnimation(.none) {
            resetPosition()
            withAnimation {
                draggableToyOpaciy = 1.0
            }
        }
    }
    
    func generateNewGame() {
        toyContainers = Array(Toy.all.shuffled().prefix(6))
        toys = Array(toyContainers.shuffled().prefix(3))
        attempts = -2
        nextRound()
    }
    
    // MARK: - Update on the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func confirmDrop() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        if highlightedId == currentToy?.id {
            guard let frame = frames[highlightedId] else {
                return
            }
            
            currentPosition = .init(x: frame.midX, y: frame.midY)
            draggableToyOpaciy = 0
            nextRound()
        } else {
            resetPosition()
        }
        
        attempts += 1
    }
    
    func resetPosition() {
        currentPosition = SizeScale.initialPosition
    }
    
    func isHighlighted(_ id: Int) -> Bool {
        highlightedId == id
    }
}
