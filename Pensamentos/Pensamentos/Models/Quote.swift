//
//  Quotes.swift
//  Pensamentos
//
//  Created by Jhenifer Dias on 06/11/22.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        
        return "〝" + quote + "〞"
    }
    
    var authorFormatted: String {
        
        return "- " + author + " -"
    }
}

