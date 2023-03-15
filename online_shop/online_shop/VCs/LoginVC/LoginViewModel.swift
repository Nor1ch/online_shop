//
//  LoginViewModel.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation

class LoginViewModel {
    
    typealias Routes = TabbarRoute
    private let router: Routes
    
    init(router: Routes){
        self.router = router
    }
    
    func makeTabbar(){
        router.openTabbar()
    }
}
