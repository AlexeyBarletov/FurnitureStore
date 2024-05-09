//
//  GoodsScreenViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

/// Модель представления экрана товаров
class GoodsScreenViewModel: ObservableObject {
    
    @Published var totalPrice = 0
    @Published  var listInfoFurniture: [GoodsModel] = [
    .init(nameImage: "sofa1", nameText: "Sofa", priceDiscount: 999, noPriceDiscount: "2000", quantityProduct: 0, isBoll: false),
    .init(nameImage: "armchair", nameText: "Armchair", priceDiscount: 99, noPriceDiscount: "220", quantityProduct: 0, isBoll: false),
    .init(nameImage: "bed", nameText: "Bed", priceDiscount: 1000, noPriceDiscount: "2000", quantityProduct: 0, isBoll: false),
    .init(nameImage: "table", nameText: "Table", priceDiscount: 600, noPriceDiscount: "1200", quantityProduct: 0, isBoll: false),
    .init(nameImage: "chair", nameText: "Сhair", priceDiscount: 99, noPriceDiscount: "200", quantityProduct: 0, isBoll: false),
    .init(nameImage:  "wardrope", nameText: "Wardrobe", priceDiscount: 899, noPriceDiscount: "1100", quantityProduct: 0, isBoll: false)
    ]
    
    
    func makeResultMinus(param: Int) {
        totalPrice += listInfoFurniture[param].priceDiscount
        listInfoFurniture[param].quantityProduct += 1
    }
    
    func makeResultPlus(param: Int) {
        if listInfoFurniture[param].quantityProduct >= 1  {
            totalPrice -= listInfoFurniture[param].priceDiscount
            listInfoFurniture[param].quantityProduct -= 1
        }

    }
}
