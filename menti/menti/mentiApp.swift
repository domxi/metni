//
//  mentiApp.swift
//  menti
//
//  Created by Dominik on 7/17/23.
//

import SwiftUI

public var quote = "no_quote_avaiable"
public var author = "no_author_available"
public var user = "Johnny"

@main
struct mentiApp: App {
    
    init() {
        onStart()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func onStart() {
    
    struct Response: Codable { // or Decodable
      let q: String
      let a: String
      let h: String
    }
        
    if let url = URL(string: "https://zenquotes.io/api/today") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                 let res = try JSONDecoder().decode([Response].self, from: data)
                 print(res[0].q)
                 quote = res[0].q
                 print(res[0].a)
                 author = res[0].a
              } catch let error {
                 print(error)
              }
           }
       }.resume()
    }
}
