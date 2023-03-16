//
//  SigninRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol SigninRoute {
    func makeSignin() -> UIViewController
    func openSignin()
}

extension SigninRoute where Self: Router {
    func makeSignin() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = SigninViewModel(router: router)
        let viewController = SigninVC(viewModel: viewModel)
        router.root = viewController
        return viewController
    }
    func openSignin(with transition: Transition){
        let router = MainRouter(rootTransition: transition)
        let viewModel = SigninViewModel(router: router)
        let viewController = SigninVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openSignin(){
         openSignin(with: ModalTransition())
    }
}

extension MainRouter : SigninRoute {}
