//
//  News.swift
//  Vote-Prototype
//
//  Created by Sunniyatul Quaderin on 10/7/20.
//

import Foundation
struct NewsAPI{
    
    let newsURL = "https://gnews.io/api/v4/search?token=fbb12c0089ce8ee68c9b255e44030273&lang=en&country=us&max=10"
    func fetchNews(newsTag:String){
        
        let urlString = "\(newsURL)&q=\(newsTag)"
        
    }
}
