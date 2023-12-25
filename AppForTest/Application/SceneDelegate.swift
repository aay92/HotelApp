//
//  SceneDelegate.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if let window {
            appCoordinator = AppCoordinator(window: window)
//            appCoordinator?.start()
            appCoordinator?.startWhatNeedMe()
        }
//        let vc = MainVC()
//        let nav = UINavigationController(rootViewController: vc)
//        window.rootViewController = nav
//        self.window = window
//        window.makeKeyAndVisible()
    }
}

