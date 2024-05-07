//
//  RegistrationScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI
import UIKit


struct RegistrationScreen: View {
    
    enum Constant {
      static let singUPText = "Sing Up"
        static let loginText = "Log in"
        static let yourPasswordText = "Forgot your password?"
        static let checkVerificationText = "Check Verification"
        static let texSupport = "Tex.Поддержка"
        static let numberIphone = "+79007778888"
        static let okTextButtonAlert = "OK"
        static let cancelTextButtonAlert = "Cancel"
        static let numberText = "Number"
        static let mask = "+X (XXX) XXX-XX-XX"
        static let password = "Password"
    }

    @State var  passwordState = ""
    @State var text = ""
    @State var password: Bool = false
    @State var isAlert = false
    @State private var minimumPasswordLength = 6
    @State private var maximumPasswordLength = 15
    @FocusState  var isFocus: Bool
    @FocusState var transfer: Transfer?
    
    
    var placeholder: String = ""
    var linkMainScreen = ContentView()
    var viewModelRegistration = RegistrationMainViewModel()
    
    enum Transfer {
        case oneNumber
        case twoNumber
    }
    
    var body: some View {
        VStack {
            gradienColorNavigationBar
                .frame(height: 70)
            ZStack {
                rectangle
                rectangleView
                textField
                settupButton
            }
            .onTapGesture {
                transfer = nil
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var gradienColorNavigationBar: some View {
        LinearGradient(colors:
                        [.numberOneColorGradient,
                         .numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)
        
    }
    var settupButton: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(Constant.singUPText)
                .frame(width: 300, height: 55)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
                .cornerRadius(27)
             .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)

            VStack(spacing: 18) {
                Button(action: {
                    isAlert = true
                }) {
                    Text(Constant.yourPasswordText)
                        .font(.verdanaBold(size: 20))
                }
                .padding(.all)
                NavigationLink(destination: VertificationScreen()) {
                    Text(Constant.checkVerificationText)
                        .font(.verdanaBold(size: 20))
                        .padding(.bottom, 50)
                }
            }
            .foregroundColor(.myGreen)
            .alert(isPresented: $isAlert) {
                Alert(title: Text(Constant.texSupport), message: Text(Constant.numberIphone), primaryButton: .default(Text(Constant.okTextButtonAlert), action: {
                }), secondaryButton: .cancel(Text(Constant.cancelTextButtonAlert), action: {
                }))
            }
        }
    }
    
    var rectangle: some View {
        VStack {
            Rectangle()
                .frame(width: 390, height: 744)
                .foregroundColor(.white)
                .ignoresSafeArea()
        }
    }
    
    var rectangleView: some View {
        VStack{
            ZStack {
                Image(.ride)
                Image(.left)
                    .offset(x: -76.0, y: 0.0)
                HStack(spacing: 100) {
                    Group {
                        Text(Constant.loginText)
                        Text(Constant.singUPText)
                    }
                    .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                }
                .font(.system(size: 15))
                .bold()

            }
            .padding(.top, 39)
            Spacer()
        }
    }
    var textField: some View {
        VStack {
            VStack(alignment: .leading,  spacing: 40) {
                Text(Constant.numberText)
                    .foregroundColor(.myGreen)
                    .offset(x: 10, y: 20)
                HStack() {
                    TextField(placeholder, text: $text)
                        .focused($transfer, equals: .oneNumber)
                        .onChange(of: text, { oldValue, newValue in
                            text = viewModelRegistration.format(with: Constant.mask, phone: oldValue)
                            if newValue.count > 18 {
                                transfer = .twoNumber
                            }
                        })
                        .keyboardType(.numberPad)
                        .foregroundColor(.myGreen)
                        .font(.system(size: 20))
                }
                .padding(.trailing, 5)
                Divider()
                    .padding(.top, -35)
            }
            VStack(alignment: .leading,  spacing: 40) {
                Text("Password")
                    .foregroundColor(.myGreen)
                    .offset(x: 10, y: 20)
                HStack() {
                    Group {
                        if password {
                            TextField(Constant.password, text: $passwordState)
                        } else {
                            SecureField(Constant.password, text: $passwordState)
                        }
                    }
                    .onChange(of: passwordState) { oldValue, newValue in
                        if newValue.count < minimumPasswordLength {
                            passwordState = String(newValue.prefix(minimumPasswordLength))
                        } else if newValue.count > maximumPasswordLength {
                            passwordState = String(newValue.prefix(maximumPasswordLength))
                        }
                    }
                    
                    .focused($transfer, equals: .twoNumber)
                    .padding(.bottom, 40)
                    .foregroundColor(.myGreen)
                    .font(.system(size: 20))
                    Button {
                        password.toggle()
                    } label: {
                        Image( password ? ImageResource.see : ImageResource.noSee)
                    }
                    .shadow(color: .colorShadow, radius: 1.5)
                    .padding(.bottom, 40)
                }
            }
            .padding(.trailing)
            Divider()
                .padding(.top, -35)
        }
        .padding(.bottom, 200)
    }
}

