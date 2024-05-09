//
//  ExtensionGrdient.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI

///  Расширение для применения линейного градиента к представлению SwiftUI.
/// - Parameters:
///     -   colors: Массив цветов, которые будут использоваться в градиенте.
///     -  startPoint: Начальная точка градиента. Может быть определена с помощью значений перечисления `UnitPoint`.
///     - endPoint: Конечная точка градиента. Может быть определена с помощью значений перечисления `UnitPoint`.
/// - Returns:   Возвращает: Измененное представление с примененным линейным градиентом.
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
