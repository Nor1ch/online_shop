//
//  MessageVC.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit

class MessageVC: UIViewController {
    
    private let viewModel: MessageViewModel
    
    init(viewModel: MessageViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
