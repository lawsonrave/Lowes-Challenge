//
//  TempListTableViewCell.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/27/21.
//

import UIKit

class TempListTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    static let id = String(describing: TempListTableViewCell.self)
    var cellViewModel: CellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        weatherLabel.text = cellViewModel?.main
        tempLabel.text = "Temp: \(cellViewModel?.tempF ?? 0) ℉"
    }
    
}
