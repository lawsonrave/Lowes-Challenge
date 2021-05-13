//
//  TempListTableVC.swift
//  Lawson Lowes Challenge
//
//  Created by ravebizz on 4/26/21.
//

import UIKit

class TempListTableVC: UITableViewController {

    @IBOutlet weak var TempListTableView: UITableView!
    
    var tempListViewModel: TempListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TempListTableView.register(UINib(nibName: TempListTableViewCell.id, bundle: nil), forCellReuseIdentifier: TempListTableViewCell.id)
        navigationController?.navigationBar.barTintColor = .cyan
        navigationController?.navigationBar.isTranslucent = false
    }

}

extension TempListTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempListViewModel?.numTempModels() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TempListTableViewCell.id, for: indexPath) as? TempListTableViewCell,
              let tempItem = tempListViewModel?.getTempListItem(at: indexPath.row)
        else { return UITableViewCell() }
        
        cell.cellViewModel = CellViewModel(tempListItem: tempItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsStoryboard = UIStoryboard(name: "Details", bundle: .main)
        guard let vc = detailsStoryboard.instantiateViewController(identifier: "Details") as? DetailsVC else {
            return
        }
        if let tempListItem = tempListViewModel?.forecast.list[indexPath.row] {
            let vm = DetailsViewModel(model: tempListItem)
            vc.detailsViewModel = vm
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
