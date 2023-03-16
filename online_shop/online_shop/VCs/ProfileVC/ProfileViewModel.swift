//
//  ProfileViewModel.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

struct Cells {
    let title: String
    let balance: Int?
    let push: Bool
    let image: UIImage
    let type: TypeCell
    
    enum TypeCell {
        case trade_store, payment, balance, trade_history, restore, help, logout
    }
}

class ProfileViewModel {
    typealias Routes = SigninRoute
    private let router: Routes
    
    let cells: [Cells] = [
        Cells(title: "Trade store", balance: nil, push: true, image: Constants.Image.folder!, type: .trade_store),
        Cells(title: "Payment method", balance: nil, push: true, image: Constants.Image.folder!, type: .payment),
        Cells(title: "Balance", balance: 1593, push: false, image: Constants.Image.folder!, type: .balance),
        Cells(title: "Trade history", balance: nil, push: true, image: Constants.Image.folder!, type: .trade_history),
        Cells(title: "Restore Purchase", balance: nil, push: true, image: Constants.Image.recicle!, type: .restore),
        Cells(title: "Help", balance: nil, push: false, image: Constants.Image.help!, type: .help),
        Cells(title: "Log out", balance: nil, push: false, image: Constants.Image.logout!, type: .logout)
    ]
    
    init(router: Routes){
        self.router = router
    }
    
    func openSignin(){
        router.openSignin()
    }
}
