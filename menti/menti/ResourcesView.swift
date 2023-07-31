//
//  ResourcesView.swift
//  menti
//
//  Created by Dominik on 7/24/23.
//

import SwiftUI

struct ResourcesView: View {
    let countries = countryList
    var body: some View {
        VStack {
            Text("Resources").font(.title).fontWeight(.black)
            NavigationView {
                List {
                    ForEach(countries, id: \.self) { country in NavigationLink(destination:
                            VStack {
                        Text(country[0]).font(.title).fontWeight(.black).padding()
                        
                            Text(country[1]).padding()
                        Link("More about " + country[0].lowercased(), destination: URL(string: country[2])!).padding()

                    }.padding(.all, 30)) {
                        Image(systemName: "")
                        Text (country[0])
                    }.padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ResourcesView()
}
