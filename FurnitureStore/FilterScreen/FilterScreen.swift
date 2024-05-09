//
//  FilterScreen.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

struct FilterScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModelFilter = FilterMainViewModel()
    @State private var customSelection: ClosedRange<CGFloat> = 1000...5000
    
   @State var colorColoms: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
    ]

    var listImigeMini = ["bedMini", "sofaMini", "armchairMini"]
    var body: some View {
        VStack {
            ZStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                textNavigationBar
                backButtonView
            }
            textView
            scrollViewFilter
            sliderView
            colorPurpleView
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
    
    var textNavigationBar: some View {
        Text("Filters")
            .font(.verdanaBold(size: 20))
            .foregroundStyle(.white)
    }
    
    var backButtonView: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(.chevronLeft)
            }
            Spacer()
        }
    }
    var textView: some View {
        HStack {
            Text("Category")
                .font(.verdanaBold(size: 24))
                .foregroundStyle(.myGrey)
            Spacer()
            HStack {
                Text("More")
                    .font(.verdanaBold(size: 24))
                    .foregroundStyle(.myColorGrey)
                Button(action: {}) {
                    Image(.rideButton)
                }
                .padding()
            }
        }
    }
    
    var scrollViewFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(listImigeMini.indices, id: \.self) { element in
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 120, height: 80)
                            .foregroundColor(.whiteLight)
                        Image(listImigeMini[element])
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
    }
    
    var sliderView: some View {
        NavigationView {
            VStack {
                Text("Prices")
                    .font(.verdana(size: 24))
                    .foregroundStyle(.myGrey)
                CustomSliderView()
                }

              }
          }

var colorPurpleView: some View {
    LazyVGrid(columns: colorColoms, spacing: 16) {
        ForEach(viewModelFilter.listColor.indices, id: \.self) { index in
         makeCir
        }
        
    }
}
    func makeCircleSectionColor(color: String, index: Int) -> some View {
        Button {
            viewModelFilter.makeColor(index)
        } label: {
            Circle()
                .frame(width: 49, height: 40)
                .foregroundStyle(Color(color))
                .overlay {
                    Circle()
                        .stroke(.gray)
        }
        }
    }
    
}
#Preview {
    FilterScreen()
}
  
