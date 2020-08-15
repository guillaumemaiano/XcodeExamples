//
//  ContentView.swift
//  ViewTreeUI
//
//  Created by guillaume MAIANO on 17/01/2020.
//  Copyright © 2020 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 Print unescaped string:
-> (lldb) po NSString(string: string)
-> (lldb) po print(string)
 */
