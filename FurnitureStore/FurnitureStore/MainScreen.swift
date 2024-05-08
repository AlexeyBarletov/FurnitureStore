//
//  ContentView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//


import SwiftUI
struct ContentView: View {
    
    enum Constan {
        static let linkText = "169.ru"
        static let getText = "Get Started"
        static let urlText = "https://encrypted-tbn0.g00static.com/images?q=tbn:ANd9GcTuZkSVKI8fGbbe95vLuzwFPW9EguP-Gtih14VrrJnw2g&s"
             //убрать 11 после буквы g
        static let accounText = "Don't have an account?"
        static let singInHere = "Sing in here"
    }
    
    
    @State private var showSplash = true
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    gradientLayer
                    setupTextAndButtonView
                }
            }
        }
    }
    var setupTextAndButtonView: some View {
        VStack(spacing: 40) {
            Text(Constan.linkText)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .bold()
            displayPicture
            Spacer()
            NavigationLink(destination: TabBarView()) {
                Text(Constan.getText)
                    .frame(width: 300, height: 55)
                    .background(Color.white)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .mask(Text(Constan.getText)
                            .font(.system(size: 20).bold()
                                 )))
                    .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)
                    .foregroundColor(.clear)
                    .cornerRadius(27)
            }
            Spacer()
            textLabel
        }
    }
    
    var  displayPicture: some View {
        AsyncImage(url: URL(string: Constan.urlText)) { element in
                switch element {
            case .empty:
                Image(.imageNew)
            case .success(let image):
                    image
                .resizable ()
                .frame(width: 296, height: 212)
                clipShape(.rect(cornerRadius: 20))
            case .failure(_):
                Image(.imageNew)
            @unknown default:
                fatalError()
           }
        }
    }

    var textLabel: some View {
        VStack(spacing: 12) {
            Text(Constan.accounText)
                .font(.system(size: 16))
                .bold()
                .foregroundStyle(.white)
            NavigationLink(destination: RegistrationScreen()) {
                Text(Constan.singInHere)
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
                        [.numberOneColorGradient,
                         .numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)
    }
}
