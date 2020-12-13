//
//  MainScreenWireframe.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MainScreenWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "MainScreen", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MainScreenViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(
            view: moduleViewController,
            interactor: interactor,
            wireframe: self
        )
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MainScreenWireframe: MainScreenWireframeInterface {
    func navigate(to option: MainScreenNavigationOption) {
        switch option {
        case .addItem(let onAddItemClosure):
            presentAddItemModule(onAddItemClosure: onAddItemClosure)
        case .activityView(let countersDescription):
            presentActivityView(textToShare: countersDescription)
        case .deleteActionSheet(let selectedItemsCount, let completion):
            presentDeletationActionSheet(selectedItemsCount: selectedItemsCount, completion: completion)
        case .deleteErrorAlert(let counterTitle):
            presentDeletationErrorAlert(counterTitle: counterTitle)
        case .incrementErrorAlert(let counter):
            guard let counter = counter else {
                return
            }
            presentIncrementErrorAlert(counter: counter)
        case .decrementErrorAlert(let counter):
            guard let counter = counter else {
                return
            }
            presentIncrementErrorAlert(counter: counter)
        }
    }

    func presentAddItemModule(onAddItemClosure: @escaping (() -> Void)) {
        let wireframe = AddItemWireframe(onAddItemClosure: onAddItemClosure)
        navigationController?.pushWireframe(wireframe)
    }

    func presentActivityView(textToShare: [String]) {
        let activityViewController = UIActivityViewController(
            activityItems: textToShare,
            applicationActivities: nil
        )

        activityViewController
            .popoverPresentationController?
            .sourceView = viewController.view

        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.postToFacebook
        ]

        navigationController?.present(activityViewController, animated: true, completion: nil)
    }

    func presentDeletationActionSheet(selectedItemsCount: Int, completion: @escaping ((Bool) -> Void)) {
        let alertActionSheetController: UIAlertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: UIAlertController.Style.actionSheet)

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (_) in
            completion(false)
        }

        let countersString = selectedItemsCount > 1 ? "counters" : "counter"

        let okAction:UIAlertAction = UIAlertAction(
            title: "Delete \(selectedItemsCount) \(countersString)" ,
            style: UIAlertAction.Style.destructive) { (_) in
            completion(true)
        }

        alertActionSheetController.addAction(cancelAction)
        alertActionSheetController.addAction(okAction)

        navigationController?.present(alertActionSheetController, animated: true, completion: nil)
    }

    func presentDeletationErrorAlert(counterTitle: String) {
        let alertController: UIAlertController = UIAlertController(
            title: "Couldn’t delete the counter “\(counterTitle)”",
            message: "The Internet connection appears to be offline.",
            preferredStyle: UIAlertController.Style.alert
        )

        let cancelAction: UIAlertAction = UIAlertAction(
            title: "Dismiss",
            style: UIAlertAction.Style.cancel,handler: nil
        )

        alertController.addAction(cancelAction)

        navigationController?.present(alertController, animated: true, completion: nil)
    }

    func presentIncrementErrorAlert(counter: Counter) {

        let title = "Couldn’t update the “\(counter.title)” counter to \(counter.count + 1)"

        let message = "The Internet connection appears to be offline."
        let alertController = createAlertWithRetrier(title: title, message: message) { (_) in
            NotificationCenter.default.post(
              name: NSNotification.Name("CounterIncrementedNotification"),
              object: self,
                userInfo: ["counterId": counter.id])
        }

        navigationController?.present(alertController, animated: true, completion: nil)
    }

    func presentDecrementErrorAlert(counter: Counter) {
        let title = "Couldn’t update the “\(counter.title)” counter to \(counter.count - 1)"

        let message = "The Internet connection appears to be offline."
        let alertController = createAlertWithRetrier(title: title, message: message) { (_) in
            NotificationCenter.default.post(
              name: NSNotification.Name("CounterDecrementedNotification"),
              object: self,
                userInfo: ["counterId": counter.id])
        }

        navigationController?.present(alertController, animated: true, completion: nil)
    }

    func createAlertWithRetrier(
        title: String,
        message: String,
        retryHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController: UIAlertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )

        let retryAction: UIAlertAction = UIAlertAction(
            title: "Retry",
            style: UIAlertAction.Style.default,
            handler: retryHandler
        )

        let cancelAction: UIAlertAction = UIAlertAction(
            title: "Dismiss",
            style: UIAlertAction.Style.cancel,handler: nil
        )

        alertController.addAction(retryAction)
        alertController.addAction(cancelAction)

        return alertController
    }

}
