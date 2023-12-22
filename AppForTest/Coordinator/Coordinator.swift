//
//  Coordinator.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import Foundation


protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func remove(coordinator: Coordinator){
        childCoordinator = childCoordinator.filter{ $0 !== coordinator}
    }
}
