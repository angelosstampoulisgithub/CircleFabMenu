//
//  ContentView.swift
//  CircleFabMenu
//
//  Created by Angelos Staboulis on 16/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false

    let buttonSize: CGFloat = 60
    let radius: CGFloat = 100

    var body: some View {
        ZStack {
            // Background dimming when menu is open
            if isExpanded {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isExpanded = false
                        }
                    }
            }

            // FAB Buttons
            VStack {
                Spacer()
                HStack {
                    Spacer()

                    ZStack {
                        // Action Buttons
                        ForEach(0..<3) { index in
                            let angle = Angle(degrees: Double(index) * 45.0)
                            FabSubButton(icon: ["pencil", "trash", "heart"][index])
                                .offset(
                                    x: isExpanded ? -cos(angle.radians) * radius : 0,
                                    y: isExpanded ? -sin(angle.radians) * radius : 0
                                )
                                .opacity(isExpanded ? 1 : 0)
                                .scaleEffect(isExpanded ? 1 : 0.5)
                                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isExpanded)
                        }

                        // Main FAB Button
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "plus")
                                .rotationEffect(.degrees(isExpanded ? 45 : 0))
                                .foregroundColor(.white)
                                .frame(width: buttonSize, height: buttonSize)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
