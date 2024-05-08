//
//  VertificationScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//

import SwiftUI
struct VertificationScreen: View {

    enum Transfer {
        case oneNumber
        case twoNumber
        case thriNumber
        case fourNumber
    }
    
    enum Constant {
        static let smsMessage = "Didn’t receive sms"
        static let resendSMS = "Send sms again"
        static let verificationCode = "Verification code"
        static let checkSMSMessage = "Didn’t receive sms"
        static let continueButtonTitle = "Continue"
        static let fillMessage = "Fill in from message"
        static let oKText = "OK"
        static let cancelText = "Cancel"
        static let verrtificationText = "Verrtification"
        static let checkSMS = "Check the SMS"
        static let messagGgetVerification = "message to get verification code"
    }
    
    @ObservedObject var viewModelVertificationScreen = VertificationScreenViewModel()
    @State var isAlert = false
    @FocusState var transfer: Transfer?
    @Environment(\.presentationMode) var presentationMode
    
    var link = ContentView()
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
        .navigationBarBackButtonHidden(true)
        Spacer()
        
    }
    var continueButton: some View {
        VStack {
            Button(action: {}, label: {
                Text(Constant.continueButtonTitle)
                    .foregroundStyle(.white)
            })
            
            .frame(width: 300, height: 55)
            .background(LinearGradient(gradient: Gradient(colors: [.numberOneColorGradient, .numberTwoColorGradient]), startPoint: .leading, endPoint: .trailing)).bold()
            .clipShape(RoundedRectangle(cornerRadius: 27))
            .padding()
        }
    }


    var textLabelSmS: some View {
        VStack {
            Text(Constant.checkSMSMessage)
                .font(.verdanaBold(size: 20))
                .foregroundColor(.myGrey)
                .padding(.bottom, 7)
            
            Button(action: {
                viewModelVertificationScreen.configurRandoNumber()
                isAlert = true
            }) {
                Text(Constant.resendSMS)
                    .font(.verdanaBold(size: 20))
                    .foregroundColor(.myGrey)
            }
            
            Divider().padding(.trailing, 70).padding(.leading, 70)
            
        }
        .padding(.horizontal)
        .alert(isPresented: $isAlert) {
            Alert(title: Text(Constant.fillMessage), message: Text(viewModelVertificationScreen.list.joined()), primaryButton: .default(Text(Constant.oKText), action: {
                viewModelVertificationScreen.equalizeNumber()
            }), secondaryButton: .cancel(Text(Constant.cancelText), action: {
            }))
        }
    }
    
    var elementNavigationBar: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Image(.chevronLeft)
            }
            Text(Constant.verrtificationText)
                .frame(maxWidth: .infinity)
                .font(.verdana(size: 20))
                .foregroundStyle(.white).bold()
                .padding(.trailing, 30)
            Spacer()
        }
    }
    var setuText: some View {
        VStack {
            Image(.massage)
                .frame(width: 200, height: 200)
            Text(Constant.verificationCode)
                .font(.verdana(size: 20))
        }
        .font(.verdana(size: 20))
        .foregroundColor(.myGrey)
        .padding(.horizontal)
    }
    
    var textFilds: some View {
        HStack(alignment: .center,  spacing: 8) {
            TextField("", text: $viewModelVertificationScreen.firstTextField)
                .focused($transfer, equals: .oneNumber)
                .onChange(of: viewModelVertificationScreen.firstTextField) { oldValue, newValue in
                    transfer = .twoNumber
                    if newValue.count > 1 {
                        viewModelVertificationScreen.firstTextField = oldValue
                    }
                }
                .frame(width: 60, height: 60)
                .border(Color.myGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.seconTextField)
                .focused($transfer, equals: .twoNumber)
                .onChange(of: viewModelVertificationScreen.seconTextField, { oldValue, newValue in
                    transfer = .thriNumber
                    if newValue.count > 1 {
                        viewModelVertificationScreen.seconTextField = oldValue
                    }
                })
                .frame(width: 60, height: 60)
                .border(Color.myGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.thirdTextField)
                .frame(width: 60, height: 60)
                .focused($transfer, equals: .thriNumber)
                .onChange(of: viewModelVertificationScreen.thirdTextField, { oldValue, newValue in
                    transfer = .fourNumber
                    if newValue.count > 1 {
                        viewModelVertificationScreen.thirdTextField = oldValue
                    }
                })
                .border(Color.myGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("", text: $viewModelVertificationScreen.fourthetxtField)
                .focused($transfer, equals: .fourNumber)
                .onChange(of: viewModelVertificationScreen.fourthetxtField, { oldValue, newValue in
                    transfer = nil
                    if newValue.count > 1 {
                        viewModelVertificationScreen.fourthetxtField = oldValue
                    }
                })
                .frame(width: 60, height: 60)
                .border(Color.myGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
        }
        .multilineTextAlignment(.center)
        .font(.system(size: 40))
        .padding(.horizontal)
    }
    
    var textLabel: some View {
        VStack {
            Text(Constant.checkSMS)
                .padding()
            Text(Constant.messagGgetVerification)
                .font(.verdana(size: 16))
        }
        .font(.verdanaBold(size: 20))
        .foregroundColor(.myGrey)
        .padding(.horizontal)
        
    }
}

