//
//  SigninViewModel.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation

class SigninViewModel {
    
    typealias Routes = LoginRoute & TabbarRoute
    private let router: Routes
    
    init(router: Routes){
        self.router = router
    }
    
    func openLogin(){
        router.openLogin()
    }
    func openTabbar(){
        router.openTabbar()
    }
}
