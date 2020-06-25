//
//  ContentView.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        Webservice().fetchAllData{
            print($0)
     }
    }
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
