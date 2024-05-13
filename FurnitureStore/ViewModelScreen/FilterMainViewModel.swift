//
//  FilterMainViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

///Модель для экрана фильтрации
class FilterMainViewModel: ObservableObject {
    @Published var nameColor = "purple"
    @Published var listColor: [String] = ["aqua", "azure", "cadetBlue",
                                          "cornflowerBlue", "darkKhaki", "darkOliveGreen",
                                         "dimGrey", "khaki", "lavender", "lemonChiffon", "maroon",
                                          "mediumAquamarine", "mediumPurple", "mistyRose", "oliveDrab",
                                         "peru",  "powderBlue", "azure", "rosyBrown", "myColorTeall"]
    func makeColor(_ index: Int) {
        nameColor = "\(listColor[index])"
    }
}
