//
//  CollectionViewCell.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import SnapKit
import UIKit

class CollectionViewCellLatest: UICollectionViewCell {
    static let identifier = "Latest"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundColor = .red
    }
    private func makeConstraints(){
        
    }
}
