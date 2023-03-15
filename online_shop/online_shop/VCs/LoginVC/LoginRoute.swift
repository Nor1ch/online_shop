//
//  LoginRoute.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

protocol LoginRoute {
    func openLogin()
}

extension LoginRoute where Self: Router {
    func openLogin(with transition: Transition) {
        let router = MainRouter(rootTransition: transition)
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openLogin(){
        openLogin(with: ModalTransition())
    }
}

extension MainRouter : LoginRoute {}
