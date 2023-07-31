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

/// Demo
///
/// This is a demo of our Menti application
/// The app launches to a calm and peaceful homescreen that's designed to reduce the clutter and keep it simple
/// The home page consists of a simple image of our logo, a custom greeting, as well as the quote of the day which is pulled from an mental health api, zenquotes
/// In the next tab we have a medicine tracker which an indiviudal can use to keep track of thier medicine. It's a very simple design where the user just taps on the given medicine to mark it as complete
/// They can also go in and add a new medicine, for example we can add Paxil which is a common SSRI for depression
/// The user can also delete the medicine
/// Next up we have the resources tab which includes some of the more common disorders.
/// For each of the disorders there's a breif paragraph about the disorder as well as a link to a resource with more information
/// After the resources we have the profile tab which contains a information that the individual fills out about themselves in a journal entry style.
/// We can change the name from Johnny to Dave for example and this will reflect in the home screen.
///
///
/// Code snippets
///
/// Here are some of the code snippets from out application, the first is our code for retriving the quote and the author from the api. It downloads the jSon from the api and uses a decoder to analyze the infromation and pull the quote and author from it. These two are set as global variables for the other parts of the program to use freely.
///
/// The second is our code for the background animation which simply put takes two random colors from which a gradient is created. The gradient is then rotated to create an animation
///
///
