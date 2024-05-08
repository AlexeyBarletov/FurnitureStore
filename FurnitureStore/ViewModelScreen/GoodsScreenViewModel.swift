//
//  GoodsScreenViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

class GoodsScreenViewModel: ObservableObject {
    
    var listInfoFurniture: [GoodsModel] = [
        .init(nameImage: "sofa", nameText: "Sofa", priceDiscount: "999", noPriceDiscount: "2000"),
        .init(nameImage: "armchair", nameText: "Armchair", priceDiscount: "99", noPriceDiscount: "220"),
        .init(nameImage: "bed", nameText: "Bed", priceDiscount: "1000", noPriceDiscount: "2000"),
        .init(nameImage: "table", nameText: "Table", priceDiscount: "600", noPriceDiscount: "1200"),
        .init(nameImage: "chair", nameText: "Сhair", priceDiscount: "99", noPriceDiscount: "200"),
        .init(nameImage:  "wardrobe", nameText: "Wardrobe", priceDiscount: "899", noPriceDiscount: "1100")
    ]
    
    
    func configure(param: [GoodsModel]) {
       listInfoFurniture = param
    }

}
