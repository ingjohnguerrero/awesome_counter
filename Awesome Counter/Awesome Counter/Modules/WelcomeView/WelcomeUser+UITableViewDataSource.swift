//
//  WelcomeUser+UITableViewDataSource.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//

import Foundation
import UIKit

extension WelcomeUserViewController: UITableViewDataSource {

    func registerTableViewCells() {
        tableView.register(UINib(nibName: "WelcomeTableViewCell", bundle: nil), forCellReuseIdentifier: "WelcomeTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTableViewCell") as? WelcomeTableViewCell else {
            return UITableViewCell()
        }

        cell.configureCell(with: infoArray[indexPath.row])
        
        return cell
    }
}
