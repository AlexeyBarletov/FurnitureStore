//
//  RegistrationMainViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//
import SwiftUI
///Модель экрана регистрации
class RegistrationMainViewModel: ObservableObject {
    
    
    
    func format(with mask: String, phone: String) -> String {
           let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
           var result = ""
           var index = numbers.startIndex
           for ch in mask where index < numbers.endIndex {
               if ch == "X" {
                   result.append(numbers[index])
                   index = numbers.index(after: index)
                   
               } else {
                   result.append(ch)
               }
           }
           return result
       }
   }
