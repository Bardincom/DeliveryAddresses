//
//  SceneDelegate.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 07.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    assembly(windowScene)

  }
}

private extension SceneDelegate {
  func assembly(_ windowScene: UIWindowScene ) {
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    let viewController = AddressViewController()
    viewController.title = "Адреса доставки"
    let navigationViewController = UINavigationController(rootViewController: viewController)
    window?.rootViewController = navigationViewController

    window?.makeKeyAndVisible()
  }
}

