//
//  UserProfileViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject {
    
    
  @Published  var listInfoUserProfile: [ModelUserProfile] = [
        .init(imageName: "envelope", title: "Sity", isCircleVisible: true, circle: 3),
        .init(imageName: "bell", title: "Notification", isCircleVisible: true, circle: 4),
        .init(imageName: "human", title: "Accounts Details", isCircleVisible: false),
        .init(imageName: "basket", title: "My purchases", isCircleVisible: false),
        .init(imageName: "setting", title: "Setting", isCircleVisible: false)
    ]

}
