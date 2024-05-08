//
//  ExtensionGrdient.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI

extension View {
    func makeGridient(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        foregroundStyle(LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
    
    var gradienColorNavigationBar: some View {
        LinearGradient(colors:
                        [.numberOneColorGradient,
                         .numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

