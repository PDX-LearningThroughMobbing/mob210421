//
//  ContentView.swift
//  Shared
//
//  Created by selfoulger on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            Circle().frame(width:$0.size.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
