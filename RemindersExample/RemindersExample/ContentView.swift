//
//  ContentView.swift
//  RemindersExample
//
//  Created by guillaume MAIANO on 19/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var data: ExampleData = load("example.json")

    var body: some View {
        Text("Hello  \(data.user.name.capitalized)")
            // autocap kills my name ?!
        
       // and is buggy in this beta .autocapitalization(.allCharacters)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
