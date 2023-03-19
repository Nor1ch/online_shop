//
//  DetailsRoute.swift
//  online_shop
//
//  Created by Nor1 on 19.03.2023.
//

import Foundation
import UIKit

protocol DetailsRoute {
    func openDetails()
    func makeDetails() -> UIViewController
}

extension DetailsRoute where Self: Router {
    func openDetails(with transition: Transition) {
        let router = MainRouter(rootTransition: transition)
        let viewModel = DetailsViewModel(router: router)
        let viewController = DetailsVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openDetails(){
        openDetails(with: PushTransition())
    }
    
    func makeDetails() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = DetailsViewModel(router: router)
        let viewController = DetailsVC(viewModel: viewModel)
        router.root = viewController
        return viewController
    }
}

extension MainRouter : DetailsRoute {}
