//
//  CartRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation

import UIKit

protocol CartRoute {
    func makeCart() -> UIViewController

}

extension CartRoute where Self: Router {
    func makeCart() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = CartViewModel(router: router)
        let viewController = CartVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: nil, image: Constants.Image.cart, tag: 2)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        return navigation
    }
}

extension MainRouter: CartRoute {}
