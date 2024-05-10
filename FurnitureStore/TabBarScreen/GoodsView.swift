//
//  GoodsView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 08.05.2024.
//

import SwiftUI
///Структура для отображения товаров
struct GoodsView: View {
    
    enum Constant {
        static let placeholderText = "Search..."
        static let sofaText = "Sofa"
        static let discountPriceText = "999$"
        static let priceText = "2000$"
        static let generalPriceText = "Your total price"
        static let systemNameImageMinus = "minus"
        static let systemNameImagePlus = "plus"

    }
    
    @ObservedObject var  goodsScreenViewModel = GoodsScreenViewModel()
    @State var textFild = ""
    @State var quantities = [Int]()

    var body: some View{
        NavigationView {
            VStack {
                ZStack {
                    gradienColorNavigationBar
                        .frame(height: 70)
                    textFildView
                    buttonView
                }
                Spacer()
                roundRectangleView
                    .padding()
                scrollView
                    .shadow(color: .black.opacity(0.25), radius: 4,  y: 4)
            }
        }
    }
    
    var textFildView: some View {
        HStack {
            TextField(Constant.placeholderText, text: $textFild)
                .padding(.leading, 40)
                .frame(width: 312, height: 48)
                .background(.white)
                .cornerRadius(24)
        }
    }
    
    var buttonView: some View {
        HStack {
            Image(.glass)
                .padding(.leading, 50)
            Spacer()
            NavigationLink(destination: FilterScreen()) {
                Image(.filter)
                    .padding(.trailing, 10)
            }
        }
    }
    
    var visualElementForniture: some View {
        HStack {
            Image(.sofa1)
                .frame(width: 140, height: 140)
            
            VStack {
                Text(Constant.sofaText)
                    .font(.verdanaBold(size: 22))
                    .foregroundColor(.myGrey)
                Spacer()
                HStack {
                    Text(Constant.discountPriceText)
                        .font(.verdanaBold(size: 24))
                        .foregroundStyle(.myColorGreen)
                    
                    Text(Constant.priceText)
                        .foregroundStyle(.myGrey)
                        .font(.verdana(size: 24))
                        .strikethrough(true, color: .black)
                }
            }
        }
    }
    
    var roundRectangleView: some View {
        ZStack {
            Image(.rectangle1)
                .offset(x: 46)
            HStack {
                Text(Constant.generalPriceText)
                    .foregroundStyle(.myGrey)
                    .padding(.horizontal)
                Text("\(goodsScreenViewModel.totalPrice)")
                
                    .font(.verdanaBold(size: 22))
                    .foregroundStyle(.myGrey)
            }
        }

    }
    
    var scrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(goodsScreenViewModel.listInfoFurniture.indices, id: \.self) { furniture in
                    LazyVStack {
                        HStack {
                            Image(goodsScreenViewModel.listInfoFurniture[furniture].nameImage)
                                .frame(width: 140, height: 140)
                            VStack(alignment: .leading) {
                                Text(goodsScreenViewModel.listInfoFurniture[furniture].nameText)
                                    .font(.verdanaBold(size: 22))
                                    .foregroundColor(.myGrey)
                                
                                HStack {
                                    Text("$\(goodsScreenViewModel.listInfoFurniture[furniture].priceDiscount)")
                                        .font(.verdanaBold(size: 24))
                                        .foregroundStyle(.myColorGreen)
                                    
                                    Text("$\(goodsScreenViewModel.listInfoFurniture[furniture].noPriceDiscount)")
                                        .foregroundStyle(.myGrey)
                                        .font(.verdana(size: 24))
                                        .strikethrough(true, color: .black)
                                }
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .frame(width: 115, height: 40)
                                            .foregroundColor(.myColorRectangle)

                                        HStack {
                                            Button(action: {
                                                goodsScreenViewModel.makeResultPlus(param: furniture)
                                            }) {
                                                Image(systemName: Constant.systemNameImageMinus)
                                            }
                                            Text("\(goodsScreenViewModel.listInfoFurniture[furniture].quantityProduct)")
                                                .padding()
                                            Button(action: {
                                                goodsScreenViewModel.makeResultMinus(param: furniture)
                                            }) {
                                                Image(systemName: Constant.systemNameImagePlus)
                                            }
                                        }
                                        .foregroundColor(.myGrey)
                                        .font(.verdanaBold(size: 18))
                                    }
                                }
                            }
                        }
                    }

                    .onTapGesture {
                        goodsScreenViewModel.listInfoFurniture[furniture].isBoll.toggle()

                    }
                    .fullScreenCover(isPresented: $goodsScreenViewModel.listInfoFurniture[furniture].isBoll, content: {
                        ProductDetails(productDetaliModel: goodsScreenViewModel.listInfoFurniture[furniture])
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
            }
        }
    }
