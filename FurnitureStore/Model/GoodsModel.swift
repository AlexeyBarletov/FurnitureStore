//
//  GoodsModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
///Модель для хранения товаров
struct GoodsModel: Identifiable {
    ///id
    var id = UUID()
    /// название картинки
    var nameImage: String
    /// название дивана
    var nameText: String
    /// цена cо скидкой
    var priceDiscount: Int
    /// цена без скидки
    var noPriceDiscount: String
   ///  сумма товаров
    var quantityProduct: Int
    /// переменная Boll
    var isBoll: Bool
}
