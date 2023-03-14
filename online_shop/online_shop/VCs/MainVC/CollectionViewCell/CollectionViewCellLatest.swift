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
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "TESTOVOE"
        view.font = Constants.Font.latestTitle9
        view.textColor = Constants.Color.white
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 2
        return view
    }()
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.text = "TESTOVOE"
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
        view.text = "TESTOVOE"
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
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(10)
            make.width.equalTo(40)
        }
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(90)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(22)
        }
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(50)
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
    
    func setupCell(title: String, price: String, category: String, image: UIImage){
        titleLabel.text = title
        priceLabel.text = "$ " + price
        categoryLabel.text = category
        imageView.image = image
    }
}
