//
//  WelcomeUserViewController.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class WelcomeUserViewController: UIViewController {

    // MARK: - IBOutlets -

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!


    // MARK: - Public properties -

    var presenter: WelcomeUserPresenterInterface!

    // MARK: - Private properties -

    var infoArray: [WelcomeUserCellTuple] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        loadPresenter()
        presenter.viewDidLoad()
    }


    @IBAction func onContinueButtonTapped(_ sender: Any) {
        presenter.goToMainScreen()
    }

}

// MARK: - Extensions -

extension WelcomeUserViewController: WelcomeUserViewInterface {

    func setTableView(with tupleArray: [WelcomeUserCellTuple]) {
        infoArray = tupleArray
    }

}

extension WelcomeUserViewController {
    func loadPresenter() {
        guard (presenter != nil) else {
            _ = WelcomeUserWireframe.init(moduleViewController: self)
            return
        }
    }
}
