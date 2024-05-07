//
//  VertificationScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//

import SwiftUI
struct VertificationScreen: View {
    
    var link = ContentView()
    
    @ObservedObject var viewModelVertificationScreen = VertificationScreenViewModel()
    @State var isAlert = false
    @FocusState var transfer: Transfer?
    
    enum Transfer {
        case oneNumber
        case twoNumber
        case thriNumber
        case fourNumber
    }
    
    var body: some View {
        VStack {
            ZStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                elementNavigationBar
            }
            setuText
            textFilds
            textLabel
            continueButton
            textLabelSmS
 
        }
        Spacer()
    }
    

    var textLabelSmS: some View {
        VStack {
            Text("Didn’t receive sms")
                .font(.custom("Verdana", size: 20))
                .foregroundColor(.myGreen)
                .padding(.bottom, 7)
            
            Button(action: {
                viewModelVertificationScreen.configurRandoNumber()
                isAlert = true
            }) {
                Text("Send sms again")
                    .font(.custom("Verdana-Bold", size: 20))
                    .foregroundColor(.myGreen)
            }
            
            Divider().padding(.trailing, 70).padding(.leading, 70)
            
        }
        .padding(.horizontal)
        .alert(isPresented: $isAlert) {
            Alert(title: Text("Fill in from message"), message: Text(viewModelVertificationScreen.list.joined()), primaryButton: .default(Text("OK"), action: {
                viewModelVertificationScreen.equalizeNumber()
            }), secondaryButton: .cancel(Text("Cancel"), action: {
            }))
        }
    }
    
    var elementNavigationBar: some View {
            Text("Verrtification")
                .font(.verdana(size: 20))
                .foregroundStyle(.white)

    }
    
    var gradienColorNavigationBar: some View {
        LinearGradient(colors:
                        [.numberOneColorGradient,
                         .numberTwoColorGradient],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea(.all, edges: .all)

    }
    
    var setuText: some View {
        VStack {
            Image("massage")
                .frame(width: 200, height: 200)
            Text("Verification code")
                .font(.verdana(size: 20))
        }
        .font(.verdana(size: 20))
        .foregroundColor(.myGreen)
        .padding(.horizontal)
    }
    
    var textFilds: some View {
        HStack(alignment: .center,  spacing: 8) {
            TextField("", text: $viewModelVertificationScreen.firstTextField)
                .focused($transfer, equals: .oneNumber)
                .onChange(of: viewModelVertificationScreen.firstTextField) { _, newValue in
                    if newValue.count >= 1 {
                        transfer = .twoNumber
                    }
                }
                .frame(width: 60, height: 60)
                .border(Color.myGreen, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.seconTextField)
                .focused($transfer, equals: .twoNumber)
                .onChange(of: viewModelVertificationScreen.seconTextField, { _, newValue in
                    if newValue.count >= 1 {
                        transfer = .thriNumber
                    }
                })
                .frame(width: 60, height: 60)
                .border(Color.myGreen, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.thirdTextField)
                .frame(width: 60, height: 60)
                .focused($transfer, equals: .thriNumber)
                .onChange(of: viewModelVertificationScreen.thirdTextField, { _, newValue in
                    if newValue.count >= 1 {
                        transfer = .fourNumber
                    }
                })
                .border(Color.myGreen, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.fourthetxtField)
                .focused($transfer, equals: .fourNumber)
                .onChange(of: viewModelVertificationScreen.fourthetxtField, { _, newValue in
                    if newValue.count >= 1 {
                        transfer = nil
                    }
                })
                .frame(width: 60, height: 60)
                .border(Color.myGreen, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

        }
        .multilineTextAlignment(.center)
        .font(.system(size: 40))
        .padding(.horizontal)
    }
    
    var textLabel: some View {
        VStack {
            Text("Check the SMS")
                .padding()
            Text("message to get verification code")
                .font(.verdana(size: 16))
        }
        .font(.verdanaBold(size: 20))
        .foregroundColor(.myGreen)
        .padding(.horizontal)

    }
}

var continueButton: some View {
    VStack {
        Button(action: {}, label: {
            Text("Continue")
                .foregroundStyle(.white)
        })
    
        .frame(width: 300, height: 55)
        .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
        .clipShape(RoundedRectangle(cornerRadius: 27))
        .padding()
    }
}

