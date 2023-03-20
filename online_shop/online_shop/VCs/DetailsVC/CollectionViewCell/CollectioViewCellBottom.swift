//
//  CollectioViewCellBottom.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CollectionViewCellBottom: UICollectionViewCell {
    static let identifier = "Collection Cell Bottom"
    
    private lazy var imageViewCell: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 9
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        layer.cornerRadius = 10
        addSubview(imageViewCell)
        backgroundColor = .white
    }
    private func makeConstraints(){
        imageViewCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.left.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().inset(2)
            make.right.equalToSuperview().inset(2)
        }
    }
    func setupCell(image: UIImage) {
        imageViewCell.image = image
    }
}
