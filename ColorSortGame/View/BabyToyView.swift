//
//  BabyToyView.swift
//  ColorSortGame
//
//  Created by Denny on 04/01/23.
//

import SwiftUI

struct BabyToyView: View {
    @StateObject private var viewModel: ToyViewModel = .init()
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmDrop()
                }
            }
    }
    
    let gridItems: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: SizeScale.spacing) {
                ForEach(viewModel.toyContainers, id: \.id) { toy in
                    ToyContainer(
                        toy: toy,
                        viewModel: viewModel
                    )
                }
            }
            
            if let currentToy = viewModel.currentToy {
                DraggableToy(
                    toy: currentToy,
                    position: viewModel.currentPosition,
                    gesture: drag
                )
                .opacity(viewModel.draggableToyOpaciy)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.setUpGame()
        }
        .alert(
            Text("Congratulations, you won! 🎉"),
            isPresented: $viewModel.isGameOver,
            actions: {
                Button("OK") {
                    withAnimation {
                        viewModel.generateNewGame()
                    }
                }
            },
            message: {
                Text("Number of attempts: \(viewModel.attempts)")
            }
        )
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
