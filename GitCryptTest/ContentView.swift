//
//  ContentView.swift
//  GitCryptTest
//
//  Created by Peter van den Hamer on 17/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            ZStack {
                Color(.lightGray)
                Text("Hello, world!")
                    .foregroundColor(.black)
            }
        }
        .frame(width: 200, height: 20)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
