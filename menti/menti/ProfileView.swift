//
//  ProfileView.swift
//  menti
//
//  Created by Dominik on 7/24/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var animateGradient: Bool = false
    @State private var textName: String = "Johnny"
    
    @State var textMonth: String = ""
    @State var textDay: String = ""
    @State var textYear: String = ""
    @State var textGender: String = ""
    @State var textPronouns: String = ""
    @State var textFT: String = ""
    @State var textIN: String = ""
    
    private let startColor: Color = Color.random()//.blue
    private let endColor: Color = Color.random()//.green
    
    var body: some View {
        VStack {
            Text("About me").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.black)
            Spacer()
            HStack {
                Text("Hi, my name is").font(.headline)
                TextField("First & last name", text: $textName)
                    .onChange(of: textName) {
                        textName = textName
                        user = textName;
                    }
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text(",").font(.headline)
            }
            HStack {
                Text("I was born on").font(.headline)
                TextField("Month", text: $textMonth)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                TextField("Day", text: $textDay)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                TextField("Year", text: $textYear)
                    .padding(.all, 10)
                    
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text(".").font(.headline)
            }
            HStack {
                Text("I indentify as a").font(.headline)
                TextField("Gender", text: $textGender)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text(", and I'd like").font(.headline)
            }
            HStack {
                Text("to be referred to as").font(.headline)
                TextField("Pronouns", text: $textPronouns)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text(".").font(.headline)
            }
            HStack {
                Text("Currently, I am").font(.headline)
                TextField("ft", text: $textFT)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text("and").font(.headline)
                TextField("in", text: $textIN)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6).cornerRadius(15.0))
                    .font(.headline)
                Text("tall.").font(.headline)
            }
            Spacer()
        }
        .padding(.all, 30)
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

#Preview {
    ProfileView()
}
