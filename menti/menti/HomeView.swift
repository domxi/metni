//
//  HomeView.swift
//  menti
//
//  Created by Dominik on 7/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var animateGradient: Bool = false

    // Declarations for the the animation code
    private let startColor: Color = Color.random()
    private let endColor: Color = Color.random()
    
    var body: some View {
        VStack {
            Image("launchscreen")
                //.font(.system(size: 80))
            Text("Hi, " + user)
                .font(.system(size: 40, weight: .black, design: .rounded))
            VStack {
                Spacer()
                Text("\"" + quote + "\"")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30, weight: .bold, design: .serif))
                Text("\n")
                Text("- " + author)
                    .font(.system(size: 25, weight: .light, design: .serif))
                    .italic()
                Spacer()
            }
        }
        .padding(.all, 30)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        // Background animation
        .background {
            // Creates a gradient with the startColor and endColor (which are both randomized in the decleration above)
            LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                // Makes sure that it covers the whole screen and doesn't stop prematurely
                .edgesIgnoringSafeArea(.all)
                // For rotations (uses hue rotation to tilt 45 degrees)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    // Animate as soon as it appears and loops indef
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        // Starts animation
                        animateGradient.toggle()
                    }
                }
        }
    }
}


// This is an extension for Color
//      to use we just call Color.random()
extension Color {
    static func random() -> Color {
        // returns a random color made up of R,G,B
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

#Preview {
    HomeView()
}
