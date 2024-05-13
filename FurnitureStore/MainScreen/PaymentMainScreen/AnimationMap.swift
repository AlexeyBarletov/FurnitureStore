
//  AnimationMap.swift
//  FurnitureStore

 // Created by Алексей Барлетов on 12.05.2024.


import Foundation
import SwiftUI

struct AnimationMap: View {
    @State var isFlipped = false
    var body: some View {
        ZStack{
            MyCradLeft()
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -90),
                      axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            
            MyCradRide()
                .rotation3DEffect(
                    .degrees(isFlipped ? 90 : 0),
                      axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
                    
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                isFlipped.toggle()
            }
        }
    }
}


struct MyCradLeft: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 310, height: 180)
                .background(.red)

            
        }
    }
}

struct MyCradRide: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 310, height: 180)
                    .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
        }
    }
}
#Preview {
    AnimationMap()
}

