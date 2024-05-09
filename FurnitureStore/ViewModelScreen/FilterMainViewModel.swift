//
//  FilterMainViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

class FilterMainViewModel: ObservableObject {
    @Published var nameColor = "Color"
    @Published var listColor: [Color] = [.aqua, .azure, .cadetBlue,
                                         .cornflowerBlue, .darkKhaki, .darkOliveGreen,
                                         .dimGrey, .khaki, .lavender, .lemonChiffon, .maroon,
                                         .mediumPurple, .mediumAquamarine, .mistyRose, .oliveDrab,
                                         .peru,  .plum, .powderBlue, .rosyBrown, .teal ]

    func makeColor(_ index: Int) {
        nameColor = "Color - \(listColor[index])"
    }
}
