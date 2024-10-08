//
//  UserProfileViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

///Модель Информации о Пользователе
class UserProfileViewModel: ObservableObject {
    
  @Published  var listInfoUserProfile: [ModelUserProfile] = [
        .init(imageName: "envelope", title: "Sity", circle: 3),
        .init(imageName: "bell", title: "Notification",  circle: 4),
        .init(imageName: "human", title: "Accounts Details", circle: 0),
        .init(imageName: "basket", title: "My purchases",  circle: 0),
        .init(imageName: "setting", title: "Setting", circle: 0)
    ]

}
