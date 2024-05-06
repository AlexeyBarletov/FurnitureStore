//
//  ContentView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//


import SwiftUI

struct ContentView: View {
    private let numberOneColorGradient = Color(red: 175 / 255, green: 224 / 255, blue: 197 / 255)
    private let numberTwoColorGradient = Color(red: 50 / 255, green: 75 / 255, blue: 53 / 255)
    @State private var showSplash = true
    @State private var showElements = false
    var eeee =  [Color(red: 175 / 255, green: 224 / 255, blue: 197 / 255),
                Color(red: 50 / 255, green: 75 / 255, blue: 53 / 255)]
    
    var body: some View {
        NavigationView {
            VStack {
                if showElements {
                    ZStack {
                        gradientLayer
                        setupTextAndButtonView
                    }
                } else {
                    displayPicture
                    
                }
            }
        }
    }
    var setupTextAndButtonView: some View {
        VStack(spacing: 40) {
            Text("169.ru")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .bold()
            Image("image")
                .frame(width: 296, height: 212)
            Spacer()
            NavigationLink(destination: ProductDetails()) {
                Text("Get Started")
                    .frame(width: 300, height: 55)
                    .background(Color.white)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [numberOneColorGradient, numberTwoColorGradient]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .mask(Text("Get Started")
                            .font(.system(size: 20).bold()
                                 )))
                    .foregroundColor(.clear)
                    .cornerRadius(27)
            }
            Spacer()
            textLabel
        }
    }

    var  displayPicture: some View {
        VStack {
            if showSplash {
                ProgressView()
            } else {
                AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuZkSVKI8fGbbe95vLuzwFPW9EguP-Gtih14VrrJnw2g&s"))
            }
        }
        .onAppear {
                self.showSplash = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                    self.showElements = true
            }
        }
    }
    
    var textLabel: some View {
        VStack(spacing: 12) {
            Text("Don't have an account?")
                .font(.system(size: 16))
                .bold()
                .foregroundStyle(.white)
            NavigationLink(destination: RegistrationScreen()) {
                    Text("Sing in here")
                    .font(.system(size: 28)).bold()
            }
                Divider()
                    .background(Color.white)
                    .frame(height: 1)
                    .padding(.leading, 70)
                    .padding(.trailing, 70)
        }
        .padding()
        .bold()
         .foregroundStyle(.white)
    }
    
    var gradientLayer: some View {
        LinearGradient(colors:
                        [numberOneColorGradient,
                         numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)
    }
}
#Preview {
   // ContentView()
   // RegistrationScreen()
    ProductDetails()
}
