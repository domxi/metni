//
//  HomeView.swift
//  menti
//
//  Created by Dominik on 7/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var animateGradient: Bool = false

    private let startColor: Color = Color.random()//.blue
    private let endColor: Color = Color.random()//.green
    
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
        .background {
            LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
        }
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

#Preview {
    HomeView()
}
