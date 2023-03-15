//
//  ProfileRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol ProfileRoute {
    func makeProfile() -> UIViewController
    func openProfile()

}

extension ProfileRoute where Self: Router {
    func makeProfile() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: nil, image: Constants.Image.profile, tag: 4)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        return navigation
    }
    
    func openProfile(with transition: Transition) {
        let router = MainRouter(rootTransition: transition)
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openProfile(){
        openProfile(with: PushTransition())
    }
}

extension MainRouter: ProfileRoute {}
