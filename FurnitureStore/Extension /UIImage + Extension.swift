//
//  UIImage + Extension.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import UIKit

extension UIImage {
    /// Создает изображение с кругом заданного диаметра и цвета.
    /// - Parameters:
    ///   - diameter: Диаметр круга в точках.
    ///   - color: Цвет заливки круга. По умолчанию белый (`UIColor.white`).
    ///   - scale: Масштаб изображения. Значение 0 автоматически адаптирует масштаб к экрану устройства. По умолчанию 0.
    /// - Returns: Возвращает опциональное изображение (`UIImage?`), содержащее круг. nil, если изображение не может быть создано.
    static func circle(diameter: CGFloat, ofColor color: UIColor = .white, withScale scale: CGFloat = 0) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        color.setFill()
        context.addEllipse(in: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        context.fillPath()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
