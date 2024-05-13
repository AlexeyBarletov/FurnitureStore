//
//  ContentView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//
import SwiftUI

struct ContentView: View {
    @State private var showAccountText = false
    @State private var showSignInText = false
    @State private var showLinkText = false
    @State private var isLoading = false
    @State private var showFakeLoading = false

    enum Constan {
        static let linkText = "169.ru"
        static let getText = "Get Started"
        static let urlText = "https://cdn0.divan.ru/img/v1/0w-6odEIc8zexLNYUQ2ieys2OnOVzQVewEZM1sq6ek/rs:fit:1920:1440:0:0/g:ce:0:0/bg:ffffff/q:85/czM6Ly9kaXZhbi93aWtpLWFydGljbGUvNTAyMzkzOS5qcGc.jpg"
        static let accounText = "Don't have an account?"
        static let singInHere = "Sign in here"
    }

    @State private var showSplash = true

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    gradientLayer
                    setupTextAndButtonView
                    if showFakeLoading {
                        Color.white.opacity(0.5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .overlay(
                                ProgressView("Loading...")
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                    .scaleEffect(1.0)
                        )
                    }
                }
            }
            .opacity(showAccountText && showSignInText && showLinkText ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        showLinkText = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.spring(duration: 5.0)) {
                        showSignInText = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeInOut(duration: 6.0)) {
                        showAccountText = true
                    }
                }
            }
        }
    }

    var setupTextAndButtonView: some View {
        VStack(spacing: 40) {
            if showLinkText {
                Text(Constan.linkText)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
            }
            
            displayPicture
            Spacer()
            Button(action: {
                isLoading = true
                showFakeLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showFakeLoading = false
                }
            }) 
            {
                NavigationLink(destination: TabBarView()) {
                    Text(Constan.getText)
                        .frame(width: 300, height: 55)
                        .background(Color.white)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                            .mask(Text(Constan.getText)
                                .font(.verdanaBold(size: 24)))
                        )
                        .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)
                        .foregroundColor(.clear)
                        .cornerRadius(27)
                }
            }
            Spacer()
            
            textLabel
        }
        .padding()
    }

    var displayPicture: some View {
        AsyncImage(url: URL(string: Constan.urlText)) { element in
            switch element {
            case .empty:
                Image(.imageNew)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 296, height: 212)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure(_):
                Image(.imageNew)
            @unknown default:
                fatalError()
            }
        }
    }

    var textLabel: some View {
        VStack(spacing: 12) {
            if showAccountText && showSignInText {
                Text(Constan.accounText)
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.white)
                NavigationLink(destination: RegistrationScreen()) {
                    Text(Constan.singInHere)
                        .font(.verdanaBold(size: 28))
                        .foregroundColor(.white)
                }
                Divider()
                    .background(Color.white)
                    .frame(height: 1)
                    .padding(.horizontal, 70)
            }
        }
    }

    var gradientLayer: some View {
        LinearGradient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all, edges: .all)
    }
}

