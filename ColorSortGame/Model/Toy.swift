//
//  Toy.swift
//  ColorSortGame
//
//  Created by Denny on 04/01/23.
//

import SwiftUI

struct Toy {
    let id: Int
    let color: Color
}

extension Toy {
    static let all: [Self] = [
        .init(id: 1, color: .red),
        .init(id: 2, color: .blue),
        .init(id: 3, color: .green),
        .init(id: 4, color: .black),
        .init(id: 5, color: .orange),
        .init(id: 6, color: .purple),
        .init(id: 7, color: .brown),
        .init(id: 8, color: .cyan),
        .init(id: 9, color: .indigo),
        .init(id: 10, color: .mint),
        .init(id: 11, color: .pink),
        .init(id: 12, color: .teal),
        .init(id: 13, color: .yellow)
    ]
}
