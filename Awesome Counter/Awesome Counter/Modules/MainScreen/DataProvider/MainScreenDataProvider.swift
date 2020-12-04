//
//  MainScreenDataProvider.swift
//  Awesome Counter
//
//  Created by John Guerrero on 3/12/20.
//

import Foundation
import UIKit

class MainScreenDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
