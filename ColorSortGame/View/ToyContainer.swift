//
//  ToyContainer.swift
//  ColorSortGame
//
//  Created by Denny on 04/01/23.
//

import SwiftUI

struct ToyContainer: View {
    
    let toy: Toy
    @ObservedObject var viewModel: ToyViewModel
    @State var position: CGPoint = .zero
    var body: some View {
        ZStack {
            Circle()
                .fill(toy.color)
                .frame(
                    width: SizeScale.regularSize,
                    height: SizeScale.regularSize
                )
                .overlay {
                    GeometryReader { proxy -> Color in
                        viewModel.update(
                            frame: proxy.frame(in: .global),
                            for: toy.id
                        )
                        
                        return .clear
                    }
                }
            
            if viewModel.isHighlighted(toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.5)
                    .frame(
                        width: SizeScale.highlightedSize,
                        height: SizeScale.highlightedSize
                    )
            }
        }
        .frame(
            width: SizeScale.highlightedSize,
            height: SizeScale.highlightedSize
        )
    }
}

struct ToyContainer_Previews: PreviewProvider {
    static var previews: some View {
        ToyContainer(
            toy: Toy.all.first!,
            viewModel: ToyViewModel()
        )
    }
}
