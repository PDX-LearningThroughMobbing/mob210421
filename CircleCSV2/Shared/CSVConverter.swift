//
//  CSVConverter.swift
//  CircleCSV2
//
//  Created by James Pamplona on 4/22/21.
//

import Foundation




struct CSVConverter {
    init(fileName : String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "csv")!
        let str = try! String(contentsOf: url, encoding: .utf8)
        let rows: [String] = str.components(separatedBy: .newlines)

        print(rows)

        for row in rows {
            let items: [String] = row.components(separatedBy: ",")
        }
    }
    
    
}
