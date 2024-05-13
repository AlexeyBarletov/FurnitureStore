//
//  PaymentScreenSecond.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 12.05.2024.
//

import Foundation
import SwiftUI

struct PaymentScreenSecond: View {
    @State var secondTextFieldText = ""
    @State var firstTextFieldText = ""
    
    var body: some View {
        VStack {
            ZStack {
                textVisualComponentsSecondView()
            }
        }
        Spacer()
    }

    func textVisualComponentsSecondView() -> some View {
        let lastFourDigits: String
        if secondTextFieldText.count >= 16 {
            lastFourDigits = String(secondTextFieldText.suffix(4))
        } else {
            lastFourDigits = "0000"
        }
        let maskedNumber = "**** **** **** \(lastFourDigits)"
        
        return VStack(alignment: .leading, spacing: 5) {
            Text(maskedNumber)
                .font(.interBold(size: 20))
                .padding(.top, 10)
            HStack {
                Text("991")
                    .font(.interBold(size: 20))
                Text("CVC/CVV")
            }
            HStack {
                Text("01/28")
                    .font(.interBold(size: 20))
                Text("Valid")
                    .font(.inter(size: 16))
            }
        }
        .foregroundStyle(.white)
        .padding(.trailing, 50)
    }
}

//#Preview {
//    PaymentScreenSecond()
//}
