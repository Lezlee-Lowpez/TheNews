//
//  NewsResponse.swift
//  TheNews
//
//  Created by Lesley Lopez on 8/13/24.
//

import Foundation

struct NewsResponse: Codable, Identifiable {
    
    
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    var id: UUID {
        return UUID()
    }
}

struct Article: Codable, Identifiable {
    
  
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    var id: UUID {
        return UUID()
    }
}

struct Source: Codable, Identifiable {
    var id: String?
    var name: String?
}
