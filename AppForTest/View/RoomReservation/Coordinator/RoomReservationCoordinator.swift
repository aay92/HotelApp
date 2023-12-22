//
//  RoomReservationCoordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit

class RoomReservationCoordinator: CoordinatorBase {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationItem.titleView = .none
    }
    
    override func start() {
        let roomReservationView = RoomReservationView()
        roomReservationView.roomReservationCoordinator = self
        navigationController.pushViewController(roomReservationView, animated: true)
    }
    
    func moveOrderPaidView(){
        let orderPaidViewCoordinator = OrderPaidViewCoordinator(
            navigationController: navigationController)
        add(coordinator: orderPaidViewCoordinator)
        orderPaidViewCoordinator.start()
        orderPaidViewCoordinator.remove(coordinator: orderPaidViewCoordinator)
    }
}
