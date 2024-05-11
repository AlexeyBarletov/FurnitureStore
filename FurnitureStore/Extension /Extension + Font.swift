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
    
    static func inter(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", size: size)
    }
    static func interItalic(size: CGFloat) -> Font {
        return Font.custom("Inter-Italic", size: size)
    }
    static func interBold(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", size: size)
    }
}
