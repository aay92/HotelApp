//
//  ChooseApartmentViewCoordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//
import UIKit

class ChooseApartmentViewCoordinator: CoordinatorBase {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationItem.titleView = .none
    }
    
    override func start() {
        let chooseApartmentView = ChooseApartmentView()
        chooseApartmentView.chooseApartmentViewCoordinator = self
        navigationController.pushViewController(chooseApartmentView, animated: true)
    }
    
    func moveReservationOrder(){
        let roomReservationCoordinator = RoomReservationCoordinator(
            navigationController: navigationController)
        add(coordinator: roomReservationCoordinator)
        roomReservationCoordinator.start()
        roomReservationCoordinator.remove(coordinator: roomReservationCoordinator)
    }
}
