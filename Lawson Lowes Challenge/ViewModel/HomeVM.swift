
//
//  HomeVM.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/26/21.
//

import Foundation

class HomeVM {
   
    func getData(cityName: String?, completionHandler: ((Forecast?) -> Void)?) {
        let apiKey = "65d00499677e59496ca2f318eb68c049"
        let cityName = cityName ?? ""
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decodedData = try? JSONDecoder().decode(Forecast.self, from: data)
            DispatchQueue.main.async {
                completionHandler?(decodedData)
            }
        }
        task.resume()
    }
    
}
