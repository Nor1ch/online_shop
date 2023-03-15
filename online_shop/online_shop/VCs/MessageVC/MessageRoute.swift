//
//  MessageRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol MessageRoute {
    func makeMessage() -> UIViewController

}

extension MessageRoute where Self: Router {
    func makeMessage() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = MessageViewModel(router: router)
        let viewController = MessageVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: nil, image: Constants.Image.message, tag: 3)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        return navigation
    }
}

extension MainRouter: MessageRoute {}
