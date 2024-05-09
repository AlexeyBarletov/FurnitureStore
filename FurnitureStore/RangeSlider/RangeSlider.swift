//
//  File.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 09.05.2024.
//

import Foundation
import SwiftUI

struct CustomSliderView: View {
    @State private var selection: ClosedRange<CGFloat> = 30...50
    var body: some View {
        NavigationStack {
            VStack {
                RangeSliderView(selection: $selection, range: 30...100, minimumDistance: 0, tint: .myColorSlider )
            }
            .padding()
            .navigationTitle("Text")
        }
    }
}

struct RangeSliderView: View {
    @Binding var selection: ClosedRange<CGFloat>
    var range: ClosedRange<CGFloat>
    var minimumDistance: CGFloat = 0
    var tint: Color = .primary
    @State private var slider1: GestureProperties = .init()
    @State private var slider2: GestureProperties = .init()
    @State private var indicatorWidth: CGFloat = 0

    var body: some View {
        GeometryReader { reader in
            let maxSliderWidth = reader.size.width - 30
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(tint.tertiary)
                    .frame(height: 5)
                
                HStack(spacing: 0) {
                    Circle()
                        .fill(tint)
                        .frame(width: 15, height: 15)
                        .contentShape(.rect)
                        .overlay(alignment: .leading) {
                            Rectangle()
                                .fill(tint)
                                .frame(width: indicatorWidth, height: 5)
                                .offset(x: 15 )
                                .allowsHitTesting(false)
                        }
                        .offset(x: slider1.offset)
                        .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged{ value in
                                var translation = value.translation.width  + slider1.lastStoredOffset
                                translation = min(max(translation, 0), slider2.offset)
                                slider1.offset = translation
                                calculateNewRange(reader.size)
                            }.onEnded { _ in
                                slider1.lastStoredOffset = slider1.offset
                            }
                        
                        )
                    
                    Circle()
                        .fill(tint)
                        .frame(width: 15, height: 15)
                        .contentShape(.rect)
                        .offset(x: slider2.offset)
                        .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged{ value in
                                var translation = value.translation.width + slider2.lastStoredOffset
                                translation = min(max(translation, slider1.offset),
                                maxSliderWidth)
                                slider1.offset = translation
                                calculateNewRange(reader.size)
                            }.onEnded { _ in
                                slider2.lastStoredOffset = slider2.offset
                            }
                        )
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(height: 15)
    }
    
    private func calculateNewRange( _ size: CGSize) {
        indicatorWidth = slider2.offset - slider1.offset
        
        
    }
    
    private struct GestureProperties {
        var offset: CGFloat = 0
        var lastStoredOffset: CGFloat = 0
    }
}
#Preview {
    CustomSliderView()
}
