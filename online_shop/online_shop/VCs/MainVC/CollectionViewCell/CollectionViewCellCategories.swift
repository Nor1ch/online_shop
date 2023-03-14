//
//  CollectionViewCellCategories.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import UIKit

class CollectionViewCellCategories: UICollectionViewCell {
    static let identifier = "Categories"
    
    private lazy var imageCategory: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.categoriesTitle8
        view.textColor = Constants.Color.gray
        view.textAlignment = .center
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
        addSubview(imageCategory)
        addSubview(categoryLabel)
    }
    private func makeConstraints(){
        imageCategory.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(38)
            make.width.equalTo(42.11)
        }
        categoryLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    func setupCell(image: UIImage, title: String){
        imageCategory.image = image
        categoryLabel.text = title
    }
}
