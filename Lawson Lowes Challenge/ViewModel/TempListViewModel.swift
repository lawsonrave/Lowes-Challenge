//
//  TempListViewModel.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/29/21.
//

import Foundation

class TempListViewModel {
    
    var forecast: Forecast
    var updateHandler: (() -> Void)?
    init(forecastData: Forecast) {
        self.forecast = forecastData
    }
    
    func numTempModels() -> Int {
        return forecast.list.count
    }
    func getTempListItem(at row: Int) -> TempListItem {
        return forecast.list[row]
    }
}
