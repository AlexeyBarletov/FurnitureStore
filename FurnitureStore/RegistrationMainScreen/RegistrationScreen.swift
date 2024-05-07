//
//  RegistrationScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI
import UIKit

struct RegistrationScreen: View {
    @State var  passwordState = ""
    @State var text = ""
    @State var password: Bool = false
    @FocusState private var psswordFocusState: Bool
    
    var placeholder: String = ""
    var linkMainScreen = ContentView()
    var viewModelRegistration = RegistrationMainViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            linkMainScreen.gradientLayer
            ZStack {
                rectangle
                rectangleView
                textField
                settupButton
            }
        }
        .navigationBarBackButtonHidden(true)
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
                Image("ride")
                Image("left")
                    .offset(x: -76.0, y: 0.0)
                HStack(spacing: 100) {
                    Group {
                        Text("Log in")
                        Text("Sing up")
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
            
            
//            var textFilds: some View {
//                HStack(alignment: .center,  spacing: 8) {
//                    TextField("", text: $viewModelVertificationScreen.firstTextField)
//                        .focused($transfer, equals: .oneNumber)
//                        .onChange(of: viewModelVertificationScreen.firstTextField) { _, newValue in
//                            if newValue.count >= 1 {
//                                transfer = .twoNumber
//                            }
//                        }
//            
//            
//            
            VStack(alignment: .leading,  spacing: 40) {
                Text("Number")
                    .padding(.all)
                    .foregroundColor(.myGreen)
                    .offset(y: 40)
                HStack() {
                    TextField(placeholder, text: $text)
                        .onChange(of: text, { oldValue, newValue in
                            text = viewModelRegistration.format(with: "+X (XXX) XXX-XXXX", phone: oldValue)
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
                    .padding(.all)
                
                HStack() {
                    Group {
                        if password {
                            TextField("Password", text: $passwordState,
                                      prompt: Text("Password"))
                        } else {
                            SecureField("Password", text: $passwordState,
                                        prompt: Text("Password"))
                        }
                    }
                    .padding(.bottom, 40)
                    .foregroundColor(.myGreen)
                    .font(.system(size: 20))
                    Button {
                        password.toggle()
                    } label: {
                        Image( password ? ImageResource.see : ImageResource.noSee)
                    }
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
var settupButton: some View {
    VStack(spacing: 24) {
        Spacer()
        Text("Sing Up")
            .frame(width: 300, height: 55)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
            .cornerRadius(27)
        VStack(spacing: 18) {
            Text("Forgot your password?")
            NavigationLink(destination: VertificationScreen()) {
                Text("Check Verification")
            }
        }
        .foregroundColor(.myGreen)
        .font(.system(size: 20))
        .bold()
        Divider().padding(.leading,70).padding(.trailing, 70)
    }
    .padding(.bottom, 95)
}
