//
//  SettingsView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 10.05.2024.
//

import Foundation
import SwiftUI

struct PaymentScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                visualElementNavigationBar
            }
            ZStack(alignment: .center)  {
                visualComponentRectangleView
                visualComponentImageView
                titleInfoMapView
            }
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
    
    var visualElementNavigationBar: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(.chevronLeft)
            }
            Text("Payment")
                .frame(maxWidth: .infinity)
                .font(.verdana(size: 20))
                .foregroundStyle(.white).bold()
                .padding(.trailing, 30)
            Spacer()
        }
    }
    
    
    var visualComponentRectangleView: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 310, height: 180)
            .padding()
            .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .leading, endPoint: .trailing)
    }
    
    var visualComponentImageView: some View {
        Image(.world)
            .offset(x: 100)
            .padding(.bottom, 100)
    }
    
    var titleInfoMapView: some View {
        VStack {
            HStack {
                Text("**** **** **** 0000")
                    .font(.verdana(size: 20))
                    .foregroundStyle(.white)
                    .padding(.trailing)
            }
                Text("Card number")
                    .font(.inter(size: 16))
                    .foregroundStyle(.myGrey)
                Text("Your Name")
                    .font(.inter(size: 20))
                    .foregroundStyle(.white)
            }
        .padding()
        }
    }
    #Preview {
        PaymentScreen()
    }
    
