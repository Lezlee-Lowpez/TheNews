//
//  DataService.swift
//  TheNews
//
//  Created by Lesley Lopez on 8/13/24.
//

import Foundation

struct DataService {
    
    var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getData() async -> [Article] {
        
        //URL
        if let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us") {
            
            
            //URL Request
            if apiKey != nil {
                
                var request = URLRequest(url: url)
                request.addValue(apiKey!, forHTTPHeaderField: "X-Api-Key")
                
                //URL Session
                do {
                    let (data, response) = try await URLSession.shared.data(for:request)
                    
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: \(httpResponse.statusCode)")
                        
                        if httpResponse.statusCode == 200 {
                            //Parse the data
                            let rawData = String(data: data, encoding: .utf8) ?? "no raw body"
                            print("Raw data \(rawData)")
                            
                            let decoder = JSONDecoder()
                            
                            let results = try decoder.decode(NewsResponse.self, from: data)
                            
                            
                            
                            print("This is the results:\(results)")
                            return results.articles ?? []
                        }else {
                            let responseBody = String(data: data, encoding: .utf8) ?? "no response body"
                            print("Response Body\(responseBody)")
                        }
                        
                        
                    }
                    
                    
                } catch {
                    print("unable to create data and response?")
                    return []
                }
                
                
            } else {
                print("api key is WACK")
                return []
            }
            
        }else {
            print("your url is WACK")
            return []
        }
        
        return []
     
    }
    
}
