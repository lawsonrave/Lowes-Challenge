//
//  DetailsVC.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/28/21.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var realTempLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    var detailsViewModel: DetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        detailsViewModel?.updateUIClosure?()
    }
    
    func configureViewModel() {
        detailsViewModel?.updateUIClosure = {
            self.realTempLabel.text = self.detailsViewModel?.getRealTemp()
            self.mainLabel.text = self.detailsViewModel?.getMainText()
            self.descriptionLabel.text = self.detailsViewModel?.getDescriptionText()
            self.feelsLikeLabel.text = self.detailsViewModel?.getFeelsLikeText()
        }
    }

}
