//
//  ContentView.swift
//  TheNews
//
//  Created by Lesley Lopez on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var newsResponse = [Article]()
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                Text("USA Top News")
                    .bold()
                    .font(.title)
                Image("USAFlag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            
            
            
            List{
                ForEach(newsResponse){news in
                    VStack{
                       NewsBoxView(someArticle: news)
                    }
                    
                }
            }
            
        }.onAppear{
            Task {
                newsResponse =  await service.getData()
                }
            }
        }
    }


#Preview {
    ContentView()
}
