//
//  CoreDataService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 14/12/20.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {

    // MARK: - Dependencies -

    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var managedContext = appDelegate?.persistentContainer.viewContext
}
