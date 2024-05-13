
//  AnimationMap.swift
//  FurnitureStore

 // Created by Алексей Барлетов on 12.05.2024.


import Foundation
import SwiftUI

struct AnimationMap: View {
    @State var isFlipped = false
    @State private var animate3d = false

    var body: some View {
        
        ZStack{
            MyCradLeft().opacity(isFlipped ? 0.0 : 1.0)
            MyCradRide().opacity(isFlipped ? 1.0 : 0.0)

        }
        .modifier(FlipEffect(flipped: $isFlipped, angle: animate3d ? 180 : 0, axis: (x: 1, y: 0)))
        .onTapGesture {
            withAnimation(.linear(duration: 0.8)) {
                animate3d.toggle()
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
            Text("MyCradLeft")
                .foregroundColor(.white)
        }
    }
}

struct MyCradRide: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 310, height: 180)
                    .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                Text("MyCradRide")
                    .foregroundColor(.white)
        }
    }
}

#Preview {
    AnimationMap()
}

