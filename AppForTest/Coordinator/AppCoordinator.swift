//
//  AppCoordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

class AppCoordinator: CoordinatorBase {
    private var window: UIWindow
    
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let mainViewControllerCoordinator = MainVCCoordinator(navigationController: navigationController)
        add(coordinator: mainViewControllerCoordinator)
        mainViewControllerCoordinator.start()
    }
    override func startWhatNeedMe() {
        let roomReservationCoordinator = RoomReservationCoordinator(navigationController: navigationController)
        add(coordinator: roomReservationCoordinator)
        roomReservationCoordinator.start()
    }
}
