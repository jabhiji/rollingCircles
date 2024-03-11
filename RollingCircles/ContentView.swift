//
//  ContentView.swift
//  RollingCircles
//
//  Created by Abhijit Joshi on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var angle = 0.0 // in radians
        
    var body: some View {
        
        ZStack {
            // black background
            Color.black.ignoresSafeArea()
            
            // yellow stationary circle
            Circle()
                .fill(.yellow)
                .frame(width: 400)
            
            // outside blue circle
            Image("BlueCircle")
                .resizable()
                .frame(width: 200, height: 200)
                .rotationEffect(.radians(-2 * angle + .pi))
                .offset(x: 300 * cos(angle), y: 300 * sin(angle))
                .rotationEffect(.radians(-angle))
                .onAppear { withAnimation(.linear(duration: 1).speed(0.08)
                        .repeatForever(autoreverses: false)) {
                            angle = -2.0 * .pi
                        }
                }
            
            // inside blue circle
            Image("BlueCircle")
                .resizable()
                .frame(width: 200, height: 200)
                .rotationEffect(.radians(2 * angle))
                .offset(x: 100 * cos(angle), y: 100 * sin(angle))
                .rotationEffect(.radians(-angle))
                .onAppear {withAnimation(.linear(duration: 1).speed(0.08)
                        .repeatForever(autoreverses: false)) {
                            angle = 2.0 * .pi
                        }
                }
            
            // x and y axes
            Rectangle()
                .fill(.blue.opacity(0.5))
                .frame(height: 2)
            Rectangle()
                .fill(.blue.opacity(0.5))
                .frame(width: 2)
        }
    }
}

#Preview {
    ContentView()
}
