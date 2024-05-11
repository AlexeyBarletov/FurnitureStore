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
    @State var firstTextFieldText = ""
    @State var secondTextFieldText = ""
    @State var thirdTextField = ""
    @State private var isShowingDatePicker = false
    @State private var isYearDatePicker = false
    
    var yearRange = 2024...3005
    var dataRange = 1...31
    @State private var selectedDate = "1"
    @State private var  selectedYear = "2021"
    
    var body: some View {
        VStack {
            ZStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss().self
                    }) {
                    }
                }
                Text("Payment")
                    .frame(maxWidth: .infinity)
                    .font(.verdanaBold(size: 20))
                    .foregroundColor(.white).bold()
            }
            gradientView
            firstTextFieldView
            pickerViews
            HStack {
                Rectangle()
                    .frame(width: 150, height: 1)
                
                Spacer()
                Rectangle()
                    .frame(width: 150, height: 1)
            }
            .foregroundStyle(.myRectangle)
            eyeButtonView
            textFieldCvCView
            Divider()
            buttonView
                .padding(.top, 20)
        }
        Spacer()
            .navigationBarBackButtonHidden(true)
    }
    var pickerViews: some View {
         HStack {
             Text("Date")
             Button(action: {
                 isShowingDatePicker.toggle()
             }) {
                 Picker("Select Date", selection: $selectedDate) {
                     ForEach(dataRange, id: \.self) { number in
                         Text("\(number)")
                     }
                 }
                 .pickerStyle(.menu)
             }
             Spacer()
             Text("Year")
             Button(action: {
                 isYearDatePicker.toggle()
             }) {
                 Picker("Selected Date", selection:  $selectedYear) {
                     ForEach(yearRange, id: \.self) { number in
                         Text("\(number)")
                     }
                 }
             }
         }
         .font(.verdana(size: 20))
         .foregroundStyle(.myGrey)
         .tint(.black)
     }
    
    var firstTextFieldView: some View {
        VStack(alignment: .leading) {
            Text("Add new card")
            TextField("Cardholder name", text: $firstTextFieldText)
            Divider()
            Text("Card number")
            TextField("0000 0000 0000 0000", text: $secondTextFieldText)
            Divider()
        }
        .keyboardType(.numberPad)
        .padding(.all)
        .font(.custom("Verdana-Bold", size: 20))
        .foregroundColor(.gray)
    }
    
    
    var gradientView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 310, height: 180)
                .makeGridient(colors: [.numberTwoColorGradient, .numberOneColorGradient], startPoint: .bottom, endPoint: .top)
                .padding()
            HStack {
                Image(.world)
            }
            .padding(.leading, 210)
            .padding(.bottom, 140)
            textVisualComponentsView
        }
    }
    
    var textVisualComponentsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("**** **** **** 0000")
                .font(.custom("Inter-Bold", size: 20))
                .padding(.top, 10)
            Text("Card number")
                .padding(.bottom)
                .font(.custom("Inter", size: 16))
                .foregroundColor(.gray)
            Text("Your Name")
                .font(.custom("Inter-Bold", size: 20))
            Text("Cardholder")
                .font(.custom("Inter", size: 16))
        }
        .foregroundColor(.white)
        .padding(.trailing, 50)
    }
    
    
    var eyeButtonView: some View {
        HStack {
            Text("CVC")
                .font(.verdanaBold(size: 20))
                .foregroundStyle(.myGrey)
            Spacer()
        }
    }
    
    var textFieldCvCView: some View {
        HStack {
            TextField("000", text: $thirdTextField)
            Button(action: {}, label: {
                Image("see")
            })
            
        }
        .padding(.all)
    }
    
    var buttonView: some View {
        Text("Add now")
            .frame(width: 300, height: 55)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
            .cornerRadius(27)
         .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)
    }
}
#Preview {
    PaymentScreen()
}
