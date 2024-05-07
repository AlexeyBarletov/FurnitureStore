//
//  ProductDetails.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI

struct ProductDetails: View {
    @State var textProgreeView = ""
    @State var totalChars = 0
    @State var lastText = ""
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
            VStack {
                setupLabelButton
                setupProgresView
            }
        .navigationBarBackButtonHidden(true)
    }
    
    var buttonView: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Buy now")
                .frame(width: 300, height: 55)
                .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                .background(.white)
                .clipShape(.rect(cornerRadius: 27))
        })
    }
    
    var setupLabelButton: some View {
        VStack() {
            HStack {
                Text("Sofa Elda 900")
                    .foregroundColor(.myGreen)
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                Button(action: {
                }) {
                    Image("love")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                }
            }
            .padding(.all)
            Image("sofa")
            HStack {
                Spacer()
                ZStack {
                    Image("rectangle")
                    Text("Price: 999$")
                }
            }
            .foregroundColor(.myGreen)
            .multilineTextAlignment(.leading)
            .bold()
        }
    }
    
    var setupProgresView: some View {
        VStack {
            ZStack {
                Rectangle()
                    .cornerRadius(12)
                    .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                VStack {
                    HStack {
                        Text("Article:")
                            .bold()
                        Text("283564")
                            .font(.verdana(size: 16))
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    Text("Description: A sofa in a modern style is furniture without lush ornate decor. It has a simple or even futuristic appearance and sleek design.")
                        .font(.verdana(size: 16))
                    Text("Review")
                        .bold()
                    progreesView
                    buttonView
                }
                .padding()
                .foregroundStyle(.white)
            }
            .ignoresSafeArea()
        }
    }
    
    var progreesView: some View {
        VStack {
            HStack(alignment: .top) {
                TextEditor(text: $textProgreeView)
                    .frame(width: 285, height: 177)
                    .cornerRadius(25)
                    .scrollContentBackground(.hidden)
                Text("\(totalChars) /150")
                    .onChange(of: textProgreeView, { textProgreeView, newValue in
                        totalChars = textProgreeView.count
                        if totalChars <= 150 {
                            lastText = textProgreeView
                        } else {
                            self.textProgreeView = lastText
                        }
                    })
            }
            .font(.verdana(size: 14))
            .foregroundColor(.white)
        }
    }
}

