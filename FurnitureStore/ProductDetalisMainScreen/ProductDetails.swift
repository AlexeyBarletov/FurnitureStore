//
//  ProductDetails.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI

struct ProductDetails: View {
    @State var isStateButton = false
    @State var text = ""
    @State var totalChars = 0
    @State var lastText = ""
    var gradient = [Color(red: 175 / 255, green: 224 / 255, blue: 197 / 255),
                    Color(red: 50 / 255, green: 75 / 255, blue: 53 / 255)]
    var body: some View {
        VStack {
            ZStack {
                setupLabelButton
                setupProgresView
                progreeView
            }
        }
        .navigationBarBackButtonHidden(true)
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
            .padding(.top, 39)
            Image("sofa")
                .frame(width: 300, height: 177)
                .padding()
            Spacer()
            VStack {
                ZStack {
                    Image("rectangle")
                    Text("Price: 999$")
                    Spacer()
                }
                .padding(.leading, 200 )
                Spacer()
            }
            .foregroundColor(.myGreen)
            .multilineTextAlignment(.leading)
            .bold()
            Spacer()
                .background(.yellow)
            
        }
    }
    
    
    
    var setupProgresView: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .frame(width: 393, height: 425)
                    .cornerRadius(12)
                    .makeGridient(colors: gradient, startPoint: .top, endPoint: .bottom)
                VStack {
                    HStack {
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
                                .padding(.horizontal)
                            Text("Review")
                                .bold()
                        }
                        .foregroundStyle(.white)
                        
                    }
                    Spacer()
                        .frame(width: 350, height: 260)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    
    var progreeView: some View {
        ZStack {
            Text("eeee")
        }
    }
}

