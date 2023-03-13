//
//  MainVC.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HELLO"
        view.backgroundColor = .yellow
    }
    
    private func setupViews(){
        
    }
    private func makeConstraints(){
        
    }
    
}
