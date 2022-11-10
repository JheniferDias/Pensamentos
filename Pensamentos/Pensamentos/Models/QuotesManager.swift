//
//  QuoetesManager.swift
//  Pensamentos
//
//  Created by Jhenifer Dias on 06/11/22.
//

import Foundation

class QuotesManager  {
    
    let quotesArray: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotesArray = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote{
        let index = arc4random_uniform(UInt32(quotesArray.count))
        return quotesArray[Int(index)]
    }
}
