//
//  CSVConverter.swift
//  CircleCSV2
//
//  Created by James Pamplona on 4/22/21.
//

import Foundation

struct Item {
    var name: String
    var min: Int
    var max: Int
    
    init?(name: String, min: String, max: String) {
        self.name = name
        guard let min = Int(min),
              let max = Int(max) else { return nil }

        self.min = min
        self.max = max
    }

    func toJSON() -> String {
        let json = #"""
        {
            "name": "\#(name)"

        }
        """#

        return json
    }
}


struct CSVConverter {
    init(fileName : String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "csv")!
        let str = try! String(contentsOf: url, encoding: .utf8)
        let rows: [String] = str.components(separatedBy: .newlines)

        print(rows)

        for row in rows {
            let items: [String] = row.components(separatedBy: ",")
            let currentItem = Item(name: items[0], min: items[1], max: items[2])
        }
    }
    
    
}
