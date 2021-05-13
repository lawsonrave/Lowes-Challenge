//
//  DetailsViewModel.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/29/21.
//

import Foundation

class DetailsViewModel {
    
    let tempListItem: TempListItem
    var updateUIClosure: (() -> Void)?
    init(model: TempListItem) {
        self.tempListItem = model
        updateUIClosure?()
    }
    
    func convertToF(tempK: Double) -> Double {
        let tempC = tempK - 273.0
        let tempF = (tempC * 9.0 / 5.0) + 32
        return tempF
    }
    func getRealTemp() -> String {
        let tempF = convertToF(tempK: tempListItem.tempModel.tempK)
        return "\(String(format: "%.1f", tempF))"
    }
    func getMainText() -> String {
        return tempListItem.weather[0].main
    }
    func getDescriptionText() -> String {
        return tempListItem.weather[0].description
    }
    func getFeelsLikeText() -> String {
        let tempF = convertToF(tempK: tempListItem.tempModel.feelsLikeK)
        return "Feels like: \(String(format: "%.1f", tempF))"
    }
    
}
