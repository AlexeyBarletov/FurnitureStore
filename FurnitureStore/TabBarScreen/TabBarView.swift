//
//  TabBarView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 08.05.2024.
//

import SwiftUI
import UIKit
/// Таб бар главного экрана
struct TabBarView: View {
    init() {
           UITabBar.appearance().unselectedItemTintColor = .secondaryLabel
        }
    @State private var selectedTabIndex = 0
    var body: some View {
            VStack {
                TabView(selection: $selectedTabIndex) {
                    GoodsView()
                        .tag(0)
                        .tabItem {
                            Image("houm")
                                .renderingMode(.template)
                                .foregroundColor(Color(.secondaryLabel))
                        }
                    BasketView()
                        .tag(1)
                        .tabItem {
                            Image("basket2")
                                .renderingMode(.template)
                                .foregroundColor(Color(.secondaryLabel))
                        }
                    
                    UserProfileView()
                        .tag(2)
                        .tabItem {
                            Image("smail")
                                .renderingMode(.template)
                                .foregroundColor(Color(.secondaryLabel))
                          
                        }
                  
            }
            .accentColor(.green)
        }
    }
}
#Preview {
    TabBarView()
}
