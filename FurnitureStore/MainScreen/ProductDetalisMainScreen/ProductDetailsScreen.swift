//
//  ProductDetails.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 06.05.2024.
//

import SwiftUI

   
    
  
struct ProductDetails: View {
    enum Constant {
        static let buyNowText = "Buy now"
        static let sofaElda = "Sofa Elda 900"
        static let priceText = "Price: 999$"
        static let articleText = "Article:"
        static let numberText = "283564"
        static let progressViewText = "Description: A sofa in a modern style is furniture without lush ornate decor. It has a simple or even futuristic appearance and sleek design."
        static let reviewText = "Review"
    }
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModelProductDetalis =  ProductDetalisMainViewModel()
    var productDetaliModel: GoodsModel
    
    @State var isDragging = false
      @State var currentOffsetX: CGFloat = 0
      @State var tapped = false
      @State private var scale: CGFloat = 1.0
      

    var body: some View {
        VStack {
            setupLabelButton
            setupProgresView
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var long: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .onEnded { _ in
                withAnimation {
                    self.tapped.toggle()
                    
                }
            }
    }
    
    var buttonView: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text(Constant.buyNowText)
                .frame(width: 300, height: 55)
                .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                .background(.white)
                .clipShape(.rect(cornerRadius: 27))
                .shadow(color: .black.opacity(0.25), radius: 1, y: 4)
        })
    }
    
    var setupLabelButton: some View {
        VStack() {
            HStack {
                Text(productDetaliModel.nameText)
                    .foregroundColor(.myGrey)
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                Button(action: {
                }) {
                    Image(.love)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                }
            }
            .padding(.all)
            Image(productDetaliModel.nameImage)
                .frame(width: 300, height: 177)
            HStack {
                Spacer()
                ZStack {
                    Image(.rectangle)
                    Text("$\(productDetaliModel.priceDiscount)")
                }
            }
            .foregroundColor(.myGrey)
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
                        Text(Constant.articleText)
                            .bold()
                        Text(Constant.numberText)
                            .font(.verdana(size: 16))
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    Text(Constant.progressViewText)
                        .font(.verdana(size: 16))
                    Text(Constant.reviewText)
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
                TextEditor(text: $viewModelProductDetalis.textFieldZero)
                    .frame(width: 285, height: 177)
                    .cornerRadius(25)
                    .scrollContentBackground(.hidden)
                Text("\(viewModelProductDetalis.totalCharacter) /300")
                    .onChange(of: viewModelProductDetalis.textFieldZero, { oldValue, newValue in
                        viewModelProductDetalis.makeCharacters(newValue: newValue, oldValue: oldValue)
                    })
            }
            .font(.verdana(size: 14))
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ProductDetails( productDetaliModel: .init(nameImage: "", nameText: "", priceDiscount: 1, noPriceDiscount: "", quantityProduct: 3, isBoll: true))
}
