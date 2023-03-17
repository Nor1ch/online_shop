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
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 2
        return view
    }()
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = Constants.Color.gray_category?.withAlphaComponent(0.85)
        view.textAlignment = .center
        view.font = Constants.Font.latestCategory6
        view.textColor = Constants.Color.black
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.latestPrice7
        view.textColor = Constants.Color.white
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = Constants.Image.small_plus
        view.configuration = config
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
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(addButton)
    }
    private func makeConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.left.equalToSuperview().offset(7)
            make.height.equalTo(10)
            make.width.equalTo(40)
        }
        titleLabel.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(32)
            make.width.lessThanOrEqualTo(90)
            make.left.equalToSuperview().offset(7)
            make.right.equalTo(addButton.snp.left)
//            make.bottom.greaterThanOrEqualTo(priceLabel.snp.top)
            make.top.equalTo(categoryLabel.snp.bottom).offset(3)
        }
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(45)
            make.width.equalTo(35)
            make.height.equalTo(12)
        }
        addButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
    }
    
    func setupCell(title: String, price: Double, category: String, image: UIImage){
        titleLabel.text = title
        priceLabel.text = "$ " + String(price)
        categoryLabel.text = category
        imageView.image = image
    }
}
