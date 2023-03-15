//
//  FavoriteRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol FavoriteRoute {
    func makeFavorite() -> UIViewController

}

extension FavoriteRoute where Self: Router {
    func makeFavorite() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = FavoriteViewModel(router: router)
        let viewController = FavoriteVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: nil, image: Constants.Image.favorite, tag: 1)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        return navigation
    }
}

extension MainRouter: FavoriteRoute {}
