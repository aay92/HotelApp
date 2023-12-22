//
//  CoordinatorBase.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

class CoordinatorBase: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    func start() {
        fatalError("all children should func Start()")
    }
    
    func startWhatNeedMe() {
        fatalError("all children should func Start()")
    }
}
