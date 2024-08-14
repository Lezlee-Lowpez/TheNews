//
//  NewsBoxView.swift
//  TheNews
//
//  Created by Lesley Lopez on 8/13/24.
//

import SwiftUI

struct NewsBoxView: View {
    
    var someArticle: Article
    
    var body: some View {
 
            HStack{
                Image(systemName: "newspaper")
                Text("\(someArticle.title ?? "unknown title")")
                    .bold()
            }
            .padding()
            .background(Color(red: 159/255, green: 195/255, blue: 233/255))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
    }
}

#Preview {
    NewsBoxView(someArticle: Article(source: 
                                        Source(
                                            id: "google-news",
                                            name: "Google News"),
                                    author: "BBC.com",
                                    title: "Police release bodycam from outside Uvalde classroom shooting - BBC.com",
                                    description: nil,
                                    url: "https://news.google.com/rss/articles/CBMiV0FVX3lxTE9GQ2FMSmIyZW02NjBlU2NkN25TMTNybmdSX0ZxN0Zhb2Z1N0Q1R0w4YU1YVExYZWZtQ001MURBcUJReEFodFIxcFJZc0FwbVF6Uk1hNDVKSQ?oc=5",
                                    urlToImage: nil,
                                    publishedAt: "2024-08-12T22:12:23Z",
                                    content: nil))
}


