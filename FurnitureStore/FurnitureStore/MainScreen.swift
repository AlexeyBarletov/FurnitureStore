//
//  ContentView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//


import SwiftUI

struct ContentView: View {
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
            Text("169.ru")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .bold()
            displayPicture
            Spacer()
            NavigationLink(destination: ProductDetails()) {
                Text("Get Started")
                    .frame(width: 300, height: 55)
                    .background(Color.white)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]),
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
            AsyncImage(url: URL(string: "https://encrypted-tbn0.g11static.com/images?q=tbn:ANd9GcTuZkSVKI8fGbbe95vLuzwFPW9EguP-Gtih14VrrJnw2g&s")) { element in //убрать 11 после буквы g
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
                        [.numberOneColorGradient,
                         .numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)
    }
}
#Preview {
// ContentView()
   RegistrationScreen()
    // ProductDetails()
// VertificationScreen()
}
