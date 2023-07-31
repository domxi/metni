//
//  mentiApp.swift
//  menti
//
//  Created by Dominik on 7/17/23.
//

import SwiftUI

// Global variables for the quote and author
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

// Do this as son as the application loads
func onStart() {
    // Struct for the format of the API format
    struct Response: Codable {
      let q: String
      let a: String
      let h: String
    }
    
    // Uses the zenquotes api to download todays quote
    if let url = URL(string: "https://zenquotes.io/api/today") {
       // Downloads the contents from the url
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                    // Decodes using JSON decoder
                    let res = try JSONDecoder().decode([Response].self, from: data)
                    // For debug purposes only print quote
                    print(res[0].q)
                    // Set the quote variable
                    quote = res[0].q
                    // For debug purposes only print author
                    print(res[0].a)
                    // Set the author variable
                    author = res[0].a
              } catch let error {
                  // Error handling
                 print(error)
              }
           }
       }.resume()
    }
}
