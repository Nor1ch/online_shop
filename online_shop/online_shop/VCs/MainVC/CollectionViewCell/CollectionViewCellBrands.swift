//
//  CollectionViewCellBrands.swift
//  online_shop
//
//  Created by Nor1 on 28.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CollectionViewCellBrands: UICollectionViewCell {
    
    static let identifier = "Brands"
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = Constants.Color.black
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.latestTitle9
        view.textColor = Constants.Color.white
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 2
        view.text = "Brands"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(imageView)
        addSubview(titleLabel)
    }
    private func makeConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(60)
            make.width.lessThanOrEqualTo(90)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupCell(title: String, image: UIImage){
        titleLabel.text = title
        imageView.image = image
    }
}
