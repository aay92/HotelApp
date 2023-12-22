//
//  OrderPaidViewCoordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//


import UIKit

class OrderPaidViewCoordinator: CoordinatorBase {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationItem.titleView = .none
    }
    
    override func start() {
        let orderPaidView = OrderPaidView()
        orderPaidView.orderPaidViewCoordinator = self
        navigationController.pushViewController(orderPaidView, animated: true)
    }
}

