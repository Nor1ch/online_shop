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
}

class ProfileViewModel {
    
    let cells: [Cells] = [
        Cells(title: "Trade store", balance: nil, push: true, image: Constants.Image.folder!),
        Cells(title: "Payment method", balance: nil, push: true, image: Constants.Image.folder!),
        Cells(title: "Balance", balance: 1240, push: false, image: Constants.Image.folder!),
        Cells(title: "Trade history", balance: nil, push: true, image: Constants.Image.folder!),
        Cells(title: "Restore Purchase", balance: nil, push: true, image: Constants.Image.recicle!),
        Cells(title: "Help", balance: nil, push: false, image: Constants.Image.help!),
        Cells(title: "Log out", balance: nil, push: false, image: Constants.Image.logout!)
    ]
}
