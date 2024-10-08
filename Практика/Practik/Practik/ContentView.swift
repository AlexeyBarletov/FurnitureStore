//
//  ContentView.swift
//  Practik
//
//  Created by Алексей Барлетов on 11.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertShow = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.background)
            HStack {
                Text("Translition")
                    .font(.title)
                    .foregroundStyle(.black)
                Spacer()
                questionMarkView
            }
            .blur(radius: isAlertShow ? 10 : 0)
            .padding()
            
            if isAlertShow {
                alertView
                    .transition(.zoomAsymInOut)
                    .zIndex(1)
                
            }
        }
    }
        var questionMarkView: some View {
            Button {
                withAnimation {
                    isAlertShow.toggle()
                }
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.action)
            }
        }
    
    var alertView: some View {
        VStack(spacing: 20) {
            Text("Документы скопированы")
                .foregroundStyle(.white)
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.white)
            Button("Cancel") {
                withAnimation {
                    isAlertShow.toggle()
                }
            }
            .foregroundStyle(.red)
        }
        .padding(35)
        .background(RoundedRectangle(cornerRadius: 20).fill(.alert))
        .padding(.top, 100)
        .shadow(radius: 25)
    }
}

#Preview {
    ContentView()
}


extension AnyTransition {
   static var zoomAsymInOut: AnyTransition {
        .asymmetric(insertion: .scale(scale: 0.1, anchor: .topLeading).combined(with: .offset(y: 120)),
                    removal: .scale(scale: 0.2)
            .combined(with: .opacity))
                    
    }
}
