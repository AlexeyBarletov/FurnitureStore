//
//  ProductDetalisMainViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//

import Foundation

class ProductDetalisMainViewModel: ObservableObject {
    
    @Published var totalCharacter = 0
    @Published var textFieldZero = ""
    
    func makeCharacters (newValue: String, oldValue: String ) {
        totalCharacter = newValue.count
        if totalCharacter <= 300 {
            textFieldZero = newValue
        } else {
            textFieldZero = oldValue
        }
    }
}
