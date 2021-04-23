//
//  ContentView.swift
//  Shared
//
//  Created by selfoulger on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isLarge: Bool = true
    var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    var body: some View {
            Circle()
                .frame(width: isLarge ? $0.size.width : 10)
                .onReceive(timer, perform: { _ in
                    isLarge.toggle()
                })
                .animation(.easeIn(duration: 4.0))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
