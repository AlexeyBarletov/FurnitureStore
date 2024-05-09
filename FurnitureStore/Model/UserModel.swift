//
//  UserModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
///Модель экрана профиля
struct ModelUserProfile: Identifiable {
    /// id
    let id = UUID()
    /// название картинки
    let imageName: String
    /// текст
    let title: String
    /// круг
    var circle: Int
}
