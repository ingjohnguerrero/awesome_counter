//
//  WelcomeUserPresenter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class WelcomeUserPresenter {

    // MARK: - Private properties -

    private unowned let view: WelcomeUserViewInterface
    private let wireframe: WelcomeUserWireframeInterface

    // MARK: - Lifecycle -

    init(view: WelcomeUserViewInterface, wireframe: WelcomeUserWireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension WelcomeUserPresenter: WelcomeUserPresenterInterface {
    var tupleArray: [WelcomeUserCellTuple] {
        return [
            (color: #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1), imageName: "42.circle.fill", title: "Add almost anything", description: "Capture cups of lattes, frapuccinos, or anything else that can be counted."),
            (color: #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1), imageName: "person.2.fill", title: "Count to self, or with anyone", description: "Others can view or make changes. There’s no authentication API."),
            (color: #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1), imageName: "lightbulb.fill", title: "Count your thoughts", description: "Possibilities are literally endless.")
        ]
    }

    func viewDidLoad() {
        view.setTableView(with: tupleArray)
    }

}
