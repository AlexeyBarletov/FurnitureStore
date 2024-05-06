//
//  RegistrationScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI
import UIKit

struct RegistrationScreen: View {
    @State var  emailState = ""
    @State var  passwordState = ""
    
    @FocusState var nameIsFocused: Bool
    
    var link = ContentView()
    var listGradient =  [Color(red: 175 / 255, green: 224 / 255, blue: 197 / 255),
                         Color(red: 50 / 255, green: 75 / 255, blue: 53 / 255)]
    var colorCircle = #colorLiteral(red: 0.9437311888, green: 0.940849483, blue: 0.9499775767, alpha: 1)
    
    
    var body: some View {
        VStack(spacing: 0) {
            link.gradientLayer
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
                    .makeGridient(colors: listGradient, startPoint: .top, endPoint: .bottom)
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
                Text("Number")
                    .padding(.all)
                    .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                    .offset(y: 40)
                HStack() {
                    TextField("+7 (999) 999-99-99", text: $emailState)
                        .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                        .font(.system(size: 20))
                    Image("see")
                }
                .padding(.trailing, 5)
                Divider()
                    .padding(.top, -35)
            }
            VStack(alignment: .leading,  spacing: 40) {
                Text("Password")
                    .padding(.all)
                    .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                    .offset(y: 40)
                HStack() {
                    TextField("Password", text: $passwordState)
                        .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                        .font(.system(size: 20))
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
                .background(LinearGradient(gradient: Gradient(colors: listGradient), startPoint: .leading, endPoint: .trailing)).bold()
                .cornerRadius(27)
            VStack(spacing: 18) {
                Text("Forgot your password?")
                Text("Check Verification")
            }
            .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
            .font(.system(size: 20))
            .bold()
            Divider().padding(.leading,70).padding(.trailing, 70)
        }
        .padding(.bottom, 95)
    }
}
