//
//  GoodsView.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 08.05.2024.
//

import SwiftUI
struct GoodsView: View {
    @ObservedObject var  goodsScreenViewModel = GoodsScreenViewModel()
    @State var textFild = ""
    @State var quantities = [Int]()
    var body: some View{
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
            }
            .navigationBarBackButtonHidden(true)
    }
    var textFildView: some View {
        HStack {
            TextField("Search...", text: $textFild)
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
                        Image("filter")
                    .padding(.trailing, 10)
            }
        }
    }
    var visualElementForniture: some View {
        HStack {
            Image("sofa1")
                .frame(width: 140, height: 140)
            
            VStack {
                Text("Sofa")
                    .font(.verdanaBold(size: 22))
                    .foregroundColor(.myGrey)
                Spacer()
                HStack {
                    Text("999$")
                        .font(.verdanaBold(size: 24))
                        .foregroundStyle(.myColorGreen)
                    
                    Text("2000$")
                        .foregroundStyle(.myGrey)
                        .font(.verdana(size: 24))
                        .strikethrough(true, color: .black)
                }
            }
        }
    }
    
    var roundRectangleView: some View {
        ZStack {
            Image("rectangle1")
                .offset(x: 46)
            HStack {
                Text("Your total price")
                    .foregroundStyle(.myGrey)
                    .padding(.horizontal)
                Text("1999$")
                    .font(.verdanaBold(size: 22))
                    .foregroundStyle(.myGrey)
            }
        }
    }
    
    var scrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(goodsScreenViewModel.listInfoFurniture.indices, id: \.self) { furniture in
                VStack {
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
                                                    goodsScreenViewModel.listInfoFurniture[furniture].quantityProduct -= 1
                                                }) {
                                                    Image(systemName: "minus")
                                                }
                                                Text("\(goodsScreenViewModel.listInfoFurniture[furniture].quantityProduct)")
                                                    .padding()
                                                Button(action: {
                                                    goodsScreenViewModel.listInfoFurniture[furniture].quantityProduct += 1
                                          
                                                }) {
                                                    Image(systemName: "plus")
                                                }
                                            }
                                    .foregroundColor(.myGrey)
                                    .font(.verdanaBold(size: 18))
                                }
                            }                       
                        }
                    }
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
}
//#Preview {
//    TabBarView()
//}
