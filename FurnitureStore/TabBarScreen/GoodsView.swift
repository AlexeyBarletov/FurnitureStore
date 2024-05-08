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
            scrollView
        }
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
            Image("filter")
                .padding(.trailing, 10)
        }
    }
    
    var roundRectangleView: some View {
          Image("rectangle1")

    }
    
    var scrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<6, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 247 / 255, green: 249 / 255, blue: 248 / 255))
                    .frame(width: 360, height: 150)
            }
        }
    }
}

#Preview {
    TabBarView()
}
