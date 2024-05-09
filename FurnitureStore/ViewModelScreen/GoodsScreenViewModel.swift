//
//  GoodsScreenViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

class GoodsScreenViewModel: ObservableObject {
    
@Published  var listInfoFurniture: [GoodsModel] = [
        .init(nameImage: "sofa1", nameText: "Sofa", priceDiscount: 999, noPriceDiscount: "2000", quantityProduct: 1),
        .init(nameImage: "armchair", nameText: "Armchair", priceDiscount: 99, noPriceDiscount: "220", quantityProduct: 1),
        .init(nameImage: "bed", nameText: "Bed", priceDiscount: 1000, noPriceDiscount: "2000", quantityProduct: 1),
        .init(nameImage: "table", nameText: "Table", priceDiscount: 600, noPriceDiscount: "1200", quantityProduct: 1),
        .init(nameImage: "chair", nameText: "Сhair", priceDiscount: 99, noPriceDiscount: "200", quantityProduct: 1),
        .init(nameImage:  "wardrope", nameText: "Wardrobe", priceDiscount: 899, noPriceDiscount: "1100", quantityProduct: 1)
    ]
    
}
