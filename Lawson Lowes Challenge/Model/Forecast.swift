//
//  Forecast.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/26/21.
//

import Foundation

struct Forecast: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case list = "list"
    }
    
    var list: [TempListItem]
    
}

struct TempListItem: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case tempModel = "main"
        case weather = "weather"
    }
    
    var tempModel: TempModel
    var weather: [Detail]
    
}

struct TempModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case tempK = "temp"
        case feelsLikeK = "feels_like"
    }
    
    var tempK: Double
    var feelsLikeK: Double
    
}

struct Detail: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case description = "description"
    }
    
    let main: String
    let description: String
}
