//
//  MainScreenPresenter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MainScreenPresenter {

    // MARK: - Private properties -

    private unowned let view: MainScreenViewInterface
    private let interactor: MainScreenInteractorInterface
    private let wireframe: MainScreenWireframeInterface
    private let itemManager: CounterItemManager!

    // MARK: - Lifecycle -

    init(view: MainScreenViewInterface, interactor: MainScreenInteractorInterface, wireframe: MainScreenWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.itemManager = CounterItemManager()
    }

    deinit {
        removeNotificationObserver()
    }
}

// MARK: - Extensions -

extension MainScreenPresenter: MainScreenPresenterInterface {

    func viewDidLoad() {
        defer {
            addNotificationObserver()
        }
        itemManager.setItems([])
        view.setItemManager(itemManager)
        loadCounters()
    }

    func viewDidAppear() {

    }

    fileprivate func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(incrementCounter(sender:)),
            name: NSNotification.Name("CounterIncrementedNotification"),
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(decrementCounter(sender:)),
            name: NSNotification.Name("CounterDecrementedNotification"),
            object: nil)
    }

    @objc func incrementCounter(sender: NSNotification) {
        guard let counterId = sender.userInfo?["counterId"] as? String else { fatalError() }
        interactor.incrementCounter(byId: counterId) { [weak self] (_, responseError) in
            guard responseError == nil, let strongSelf = self else {
                let counter = self?.itemManager.item(byId: counterId)
                self?.wireframe.navigate(to: .incrementErrorAlert(counter))
                return
            }
            _ = strongSelf.itemManager.incrementCounter(byId: counterId )
            strongSelf.view.updateCountersInformation()
        }
    }

    @objc func decrementCounter(sender: NSNotification) {
        guard let counterId = sender.userInfo?["counterId"] as? String else { fatalError() }
        interactor.decrementCounter(byId: counterId) { [weak self] (_, responseError) in
            guard responseError == nil, let strongSelf = self else {
                let counter = self?.itemManager.item(byId: counterId)
                self?.wireframe.navigate(to: .decrementErrorAlert(counter))
                return
            }
            _ = strongSelf.itemManager.decrementCounter(byId: counterId )
            strongSelf.view.updateCountersInformation()
        }
    }

    func presentAddItemModule() {
        wireframe.navigate(to: MainScreenNavigationOption.addItem({ [weak self] () in
            guard let strongSelf = self else {
                return
            }
            strongSelf.loadCounters()
        }))
    }

    fileprivate func validateCountersAndSetView() {
        if itemManager.itemsCount > 0 {
            view.setContentView()
        } else {
            view.setEmptyView()
        }
    }

    func loadCounters() {
        view.startLoading()
        interactor.getCounters { [weak self] (responseCounters, responseError) in
            guard responseError == nil, let strongSelf = self else {
                self?.view.finishLoading()
                self?.view.setErrorView()
                return
            }

            strongSelf.itemManager.setItems(responseCounters)
            strongSelf.validateCountersAndSetView()

            strongSelf.view.finishLoading()
        }
    }

    func refreshCounters() {
        interactor.getCounters { [weak self] (responseCounters, responseError) in
            guard responseError == nil, let strongSelf = self else {
                self?.view.setErrorView()
                return
            }

            strongSelf.itemManager.setItems(responseCounters)
            strongSelf.validateCountersAndSetView()
            strongSelf.view.endTableViewRefreshing()
        }
    }

    fileprivate func deleteCounterUponConfirmation(_ counterIds: [String]) {
        DispatchQueue.global().async {
            let semaphore = DispatchSemaphore(value: 0)
            var batchError: Bool = false
            for counterId in counterIds {
                self.interactor.deleteCounter(byId: counterId) { (_, responseError) in
                    guard responseError == nil else {
                        batchError = true
                        let counter = self.itemManager.item(byId: counterId)
                        self.wireframe.navigate(to: .deleteErrorAlert(counter?.title ?? ""))
                        semaphore.signal()
                        return
                    }
                    self.itemManager.removeItem(byId: counterId)
                    self.validateCountersAndSetView()
                    semaphore.signal()
                }
                semaphore.wait()

                if batchError {
                    break
                }
            }
        }
    }

    func deleteCounters(byIds counterIds: [String]) {
        wireframe.navigate(to: .deleteActionSheet(counterIds.count, { [weak self] (performDeletation) in
            if performDeletation {
                self?.deleteCounterUponConfirmation(counterIds)
            }
        }))
    }

    func shareCounters(byIds counterIds: [String]) {
        let countersDescription = itemManager.counterDescriptions(byIds: counterIds)
        wireframe.navigate(to: .activityView(countersDescription))
    }

}
