//
//  SettingsView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 10.05.2024.
//


import Foundation
import SwiftUI
struct PaymentScreenFirst: View {
    @Environment(\.presentationMode) var presentationMode
    @State var firstTextFieldText = ""
    @State var secondTextFieldText = ""
    @State var thirdTextFieldText = ""
    @State private var passwordState = ""
    @State private var isShowingDatePicker = false
    @State private var isYearDatePicker = false
    @State private var showingAlert = false
    @State private var showingAlertInfoDeveloper = false
    @State var paymentScreenSecond = PaymentScreenSecond()
    
    var viewModelRegistration = RegistrationMainViewModel()
    let mask = "XXXX-XXXX-XXXX-XXXX"
    var placeholder: String = "0000 0000 0000 0000"
    
    var yearRange = 2024...3005
    private let minimumPasswordLength = 3
    private let maximumPasswordLength = 3
    var dataRange = 1...31
    @State private var selectedDate = 1
    @State private var  selectedYear = 2021
    @State private var cvcPassword = false
    
    @State var isFlipped = false
    @State private var animate3d = false
    
    
    
    var body: some View {
        VStack {
            ZStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                backView
            }
            ScrollView {
                VStack {
                    gradientView
                    firstTextFieldView
                    pickerViews
                    rectangleView
                    eyeButtonView
                    textFieldCvCView
                }
                Divider()
            }
            buttonView
                .padding(.top, 20)
        }
        Spacer()
            .navigationBarBackButtonHidden(true)
    }
    
    var rectangleView: some View {
        HStack {
            Rectangle()
                .frame(width: 150, height: 1)
            Spacer()
            Rectangle()
                .frame(width: 150, height: 1)
        }
        .foregroundStyle(.myRectangle)
    }
    
    var backView: some View {
        HStack {
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss().self
            }) {
                Image(.chevronLeft)
                
            }
            VStack {
                Text("Payment")
                    .frame(maxWidth: .infinity)
                    .font(.verdanaBold(size: 20))
                    .foregroundColor(.white).bold()
            }
        }
    }
    var pickerViews: some View {
        HStack {
            Text("Date")
            Button(action: {
                isShowingDatePicker.toggle()
            }) {
                Picker("Select Date", selection: $selectedDate) {
                    ForEach(dataRange, id: \.self) { number in
                        Text("\(number)").tag(number)
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
                        Text("\(number)").tag(number)
                    }
                }
            }
        }
        .padding()
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
                .onChange(of: secondTextFieldText) { oldValue, newValue in
                    withAnimation {
                        secondTextFieldText = viewModelRegistration.format(with: "XXXX-XXXX-XXXX-XXXX", phone: newValue)
                    }
                }
                .keyboardType(.numberPad)
            Divider()
        }
        .padding(.all)
        .font(.custom("Verdana-Bold", size: 20))
        .foregroundColor(.gray)
    }
    
    
    var gradientView: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 310, height: 180)
                    .makeGridient(colors: [.numberTwoColorGradient, .numberOneColorGradient], startPoint: .bottom, endPoint: .top)
                    
                    .overlay {
                        ZStack {
                            textVisualComponentsView()
                                .opacity(isFlipped ? 0 : 1)
                            PaymentScreenSecond()
                                .opacity(isFlipped ? 1 : 0)
                            HStack {
                                Image(.world)
                            }
                            .padding(.leading, 210)
                            .padding(.bottom, 140)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            animate3d.toggle()
                        }
                    }
                    .modifier(FlipEffect(flipped: $isFlipped, angle: animate3d ? 180 : 0, axis: (x: 1, y: 0)))
            }
        }
    }
    
    func textVisualComponentsView() -> some View {
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
            Text("Card number")
                .padding(.bottom)
                .font(.custom("Inter", size: 16))
                .foregroundColor(.gray)
            
            if !firstTextFieldText.isEmpty {
                Text(firstTextFieldText)
                    .font(.custom("Inter-Bold", size: 20))
            } else {
                Text("Your Name")
                    .font(.interBold(size: 20))
            }
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
                .padding(.horizontal, 10)
            Spacer()
        }
    }
    var textFieldCvCView: some View {
        HStack {
            Group {
                if cvcPassword {
                    SecureField(thirdTextFieldText, text: $passwordState)
                } else {
                    TextField(thirdTextFieldText, text: $passwordState)
                }
            }
            .onChange(of: passwordState) { oldValue, newValue in
                if newValue.count < minimumPasswordLength {
                    passwordState = String(newValue.prefix(minimumPasswordLength))
                    showingAlert = true
                } else if newValue.count > maximumPasswordLength {
                    passwordState = String(newValue.prefix(maximumPasswordLength))
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Warning"), message: Text("Введите допустимое количество символов"), dismissButton: .default(Text("OK")))
            }
            .padding(.trailing, 10)
            Button {
                cvcPassword.toggle()
            } label: {
                Image(cvcPassword ? "see" : "noSee")
            }
            .padding(.trailing, 10)
            Divider()
        }
        .keyboardType(.numberPad)
        .multilineTextAlignment(.leading)
        
    }
    
    var buttonView: some View {
        Button(action: {
            showingAlertInfoDeveloper.toggle()
            
        }, label: {
            Text("Add now")
        })
        .alert(isPresented: $showingAlertInfoDeveloper) {
            Alert(title: Text("Information"),
                  message: Text("Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения, разработанный и поддерживаемый компанией Apple. Первая версия была представлена в 2014 году."),
                  dismissButton: .default(Text("OK")))
        }
        .frame(width: 300, height: 55)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
        .cornerRadius(27)
        .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)
    }
    var backSideView: some View {
        VStack {
            Spacer()
            Text("Back side of the card")
                .font(.custom("Inter-Bold", size: 20))
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.trailing, 50)
    }
}

#Preview {
    PaymentScreenFirst()
}
