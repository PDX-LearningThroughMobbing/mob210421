//
//  ContentView.swift
//  Shared
//
//  Created by selfoulger on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isLarge: Bool = true

    var body: some View {
        GeometryReader {
            Circle().frame(width: isLarge ? $0.size.width : 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
