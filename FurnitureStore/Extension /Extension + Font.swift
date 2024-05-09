//
//  Extension + Font.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//

import SwiftUI

extension Font {
    /// Создает и возвращает шрифт с использованием семейства шрифтов "Verdana" с заданным размером.
    /// - Parameters:
    ///   - size`: Размер шрифта в точках.
    /// - Returns:  Возвращает шрифт (`Font`), созданный с использованием семейства шрифтов "Verdana-Bold" и указанным размером.
    static func verdanaBold(size: CGFloat) -> Font {
        return Font.custom("Verdana-Bold", size: size)
    }

    static func verdana(size: CGFloat) -> Font {
        return Font.custom("Verdana", size: size)
    }
}
