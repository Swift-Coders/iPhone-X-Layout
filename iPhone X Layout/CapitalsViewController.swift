//
//  ViewController.swift
//  iPhone X Layout
//
//  Created by Yariv on 11/15/17.
//  Copyright © 2017 SwiftCoders. All rights reserved.
//

import UIKit

final class CapitalsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
    }

    func selectRandomCapital() {
        let row = Int(arc4random_uniform(UInt32(DataSource.capitals.count)))
        let indexPath = IndexPath(row: row, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
    }
}

extension CapitalsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.capitals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "custom cell", for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CustomCell else { return }

        let capital = DataSource.capitals[indexPath.row]
        cell.countryLabel?.text = capital.country
        cell.cityLabel?.text = capital.city
    }
}

final class CustomCell: UITableViewCell {
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
}
