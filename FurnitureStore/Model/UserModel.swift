//
//  UserModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation

struct ModelUserProfile: Identifiable {
    ///id
    let id = UUID()
    ///название картинки
    let imageName: String
    ///текс
    let title: String
    ///
    var isCircleVisible: Bool
    var circle: Int?
    
}
