//
//  MainVCCoordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

class MainVCCoordinator: CoordinatorBase {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainViewController = MainVC()
        mainViewController.mainVCCoordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func moveSecond(){
        let chooseApartmentViewCoordinator = ChooseApartmentViewCoordinator(
            navigationController: navigationController)
        add(coordinator: chooseApartmentViewCoordinator)
        chooseApartmentViewCoordinator.start()
        chooseApartmentViewCoordinator.remove(coordinator: chooseApartmentViewCoordinator)
    }
    
//    func moveThird(){
//        let thirdViewControllerCoordinator = ThirdViewControllerCoordinator(
//            navigationController: navigationController)
//        add(coordinator: thirdViewControllerCoordinator)
//        thirdViewControllerCoordinator.start()
//        thirdViewControllerCoordinator.remove(coordinator: thirdViewControllerCoordinator)
//    }
}
