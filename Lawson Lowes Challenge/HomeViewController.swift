//
//  HomeViewController.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/26/21.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel = HomeVM()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBAction func searchButton(_ sender: UIButton) {
        updateData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateData() {
        let cityName = cityNameTextField.text ?? ""
        viewModel.getData(cityName: cityName) { forecast in
            if let forecast = forecast {
                self.pushToTempListVC(with: forecast, cityName: cityName)
            }
        }
    }

    func pushToTempListVC(with forecastData: Forecast, cityName: String) {
        let tempListStoryboard = UIStoryboard(name: "TempList", bundle: .main)
        guard let vc = tempListStoryboard.instantiateViewController(identifier: "TempList") as? TempListTableVC else {
            return
        }
        vc.tempListViewModel = TempListViewModel(forecastData: forecastData)
        vc.title = cityName
        navigationController?.pushViewController(vc, animated: true)
    }

}

