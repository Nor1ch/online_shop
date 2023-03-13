//
//  MainVC.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit
import SnapKit

class MainVC: UICollectionViewController {
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel){
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    private func setupViews(){
        view.backgroundColor = Constants.Color.background_white
        collectionView.register(CollectionViewCellLatest.self, forCellWithReuseIdentifier: CollectionViewCellLatest.identifier)
        collectionView.dataSource = self
        title = "Trade by bata"
    }
    private func makeConstraints(){
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellLatest.identifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}
