//
//  ContentView.swift
//  menti
//
//  Created by Dominik on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    
    var body: some View {
                
        TabView (selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")}.tag(1)
            MedView()
                .tabItem {
                    Label("Med Tracker", systemImage: "pill.circle.fill")}.tag(0)
            ResourcesView()
                .tabItem {
                    Label("Resources", systemImage: "magnifyingglass.circle.fill")}.tag(2)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "brain.head.profile.fill")}.tag(3)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white.withAlphaComponent(0.6)
        }
        .background(Color.white)
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(Color.white, for: .tabBar)
    }
}

#Preview {
    ContentView()
}
