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
    @State private var navigateToNextScreen = false
    @State private var showDevelopersInfo = false

    enum Constants {
        static let linkText = "169.ru"
        static let getText = "Get Started"
        static let urlText = "https://smmplanner.com/blog/content/images/2021/06/cover-kontent-plan-dlya-mebelnogo-magazina.jpg"
        static let accountText = "Don't have an account?"
        static let signInHere = "Sign in here"
    }

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    gradientLayer
                    setupTextAndButtonView
                        .gesture(longPressGesture)
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
                    if showDevelopersInfo {
                        DeveloperInfoView()
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

    var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .onEnded { _ in
                withAnimation {
                    self.showDevelopersInfo.toggle()
                    if self.showDevelopersInfo {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.showDevelopersInfo = false
                            }
                        }
                    }
                }
            }
    }

    var setupTextAndButtonView: some View {
        VStack(spacing: 40) {
            if showLinkText {
                Text(Constants.linkText)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
            }
            
            displayPicture
            Spacer()
            Button(action: {
                isLoading = true
                showFakeLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                    showFakeLoading = false
                    navigateToNextScreen = true
                }
            })
            {
                NavigationLink(destination: TabBarView(), isActive: $navigateToNextScreen) {
                    EmptyView()
                }
                Text(Constants.getText)
                    .frame(width: 300, height: 55)
                    .background(Color.white)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .mask(Text(Constants.getText)
                                .font(.verdanaBold(size: 24)))
                    )
                    .shadow(color: .colorShadow, radius: 1.5, x: 0, y: 4)
                    .foregroundColor(.clear)
                    .cornerRadius(27)
            }
            Spacer()
            
            textLabel
        }
        .padding()
    }

    var displayPicture: some View {
        AsyncImage(url: URL(string: Constants.urlText)) { element in
            switch element {
            case .empty:
                Image("imageNew")
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 296, height: 212)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure(_):
                Image("imageNew")
            @unknown default:
                fatalError()
            }
        }
    }

    var textLabel: some View {
        VStack(spacing: 12) {
            if showAccountText && showSignInText {
                Text(Constants.accountText)
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.white)
                NavigationLink(destination: RegistrationScreen()) {
                    Text(Constants.signInHere)
                        .font(.custom("Verdana-Bold", size: 28))
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

struct DeveloperInfoView: View {
    var body: some View {
        VStack {
            Text("Alexey Barletov")
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
    }
}

#Preview {
    ContentView()
}
