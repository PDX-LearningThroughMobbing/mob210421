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
                .scale(isLarge ? 1 : 0.5)
                .onReceive(timer, perform: { _ in
                    isLarge.toggle()
                })
                .animation(.easeIn(duration: 4.0))
                .onAppear(perform: {
                    let item = Item(name: "test", min: "7", max: "300")
                    print(item?.toJSON() ?? "N/A")
                    
                    do {
                        let items = try CSVConverter.convert(fileName: "JunkCSV - Sheet1")
                        print(items)
                    } catch {
                        print(error)
                    }
                })
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
