//
//  MainRoute.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit

protocol MainRoute {
    func makeMain() -> UIViewController
    func openMain()
}

extension MainRoute where Self: Router {
    func makeMain() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = MainViewModel(router: router)
        let viewController = MainVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: nil, image: Constants.Image.home, tag: 0)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        return navigation
    }
    func openMain(transition: Transition) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = MainViewModel(router: router)
        let viewController = MainVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openMain(){
        openMain(transition: PushTransition())
    }
}

extension MainRouter: MainRoute {}



