//
//  DraggableToy.swift
//  ColorSortGame
//
//  Created by Denny on 04/01/23.
//

import SwiftUI

struct DraggableToy<Draggable: Gesture>: View {
    let toy: Toy
    private let size: CGFloat = SizeScale.regularSize
    let position: CGPoint
    let gesture: Draggable
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            .shadow(radius: SizeScale.shadowRadius)
            .position(position)
            .gesture(gesture)
    }
}

struct DraggableToy_Previews: PreviewProvider {
    static var previews: some View {
        DraggableToy(toy: Toy.all.first!, position: .init(x: 100, y: 100), gesture: DragGesture())
    }
}
