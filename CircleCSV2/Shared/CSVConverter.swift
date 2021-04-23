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
            "name": "\#(name)",
            "min": \#(min),
            "max": \#(max),
        }
        """#

        return json
    }
}


struct CSVConverter {
    enum ConvertError : Error {
        case noFile
    }
    
    static func convert(fileName: String) throws -> [Item] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv") else {
            throw ConvertError.noFile
        }
        let str = try String(contentsOf: url, encoding: .utf8)
        let rows = str.components(separatedBy: .newlines)
        
        return rows.compactMap { (rowString) -> Item? in
            let fields = rowString.components(separatedBy: ",") //important to note that this will fail with many CSV files (for example, one escaped commas). A more robust solution would be needed if one didn't have control of the input format
            guard fields.count > 2 else {
                return nil
            }
            return Item(name: fields[0], min: fields[1], max: fields[2])
        }
    }
}
