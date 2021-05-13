//
//  CellViewModel.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/29/21.
//

import Foundation

class CellViewModel {
    let main: String
    let tempK: Double
    var tempF: Int {
        let tempC = tempK - 273.0
        let tempF = (tempC * 9.0 / 5.0) + 32
        return Int(tempF.rounded())
    }
    
    init(tempListItem: TempListItem) {
        self.main = tempListItem.weather[0].main
        self.tempK = tempListItem.tempModel.tempK
    }
    
}
