//
//  TabbarRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol TabbarRoute {
    func openTabbar()
}

extension TabbarRoute where Self: Router {
    func openTabbar(with transition: Transition){
        let router = MainRouter(rootTransition: EmptyTransition())
        let tabs = [router.makeMain(), router.makeFavorite(), router.makeCart(), router.makeMessage(), router.makeProfile()]
//        let tabBar = UITabBarController()
        let tabBar = TabbarVC()
        tabBar.tabBar.layer.cornerRadius = 20
        tabBar.tabBar.layer.masksToBounds = true
        tabBar.tabBar.backgroundColor = Constants.Color.white
        tabBar.tabBar.unselectedItemTintColor = Constants.Color.gray
        tabBar.tabBar.tintColor = Constants.Color.violet
        tabBar.viewControllers = tabs
        router.root = tabBar
        route(to: tabBar, as: transition)
    }
    func openTabbar(){
        openTabbar(with: ModalTransition())
    }
}

extension MainRouter : TabbarRoute {}
