//
//  CollectionViewCellFlashSale.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import SnapKit
import UIKit

class CollectionViewCellFlashSale: UICollectionViewCell {
    static let identifier = "Flash sale"
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.flashSaleTitle13
        view.textColor = Constants.Color.white
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 2
        return view
    }()
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.flashSalePrice10
        view.textColor = Constants.Color.white
        return view
    }()
    private lazy var priceOffLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = Constants.Color.red
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.font = Constants.Font.flashSalePriceOff10
        view.textColor = Constants.Color.white
        view.textAlignment = .center
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.font = Constants.Font.flashSaleCategory9
        view.textColor = Constants.Color.black
        view.backgroundColor = Constants.Color.gray_category?.withAlphaComponent(0.85)
        view.textAlignment = .center
        return view
    }()
    private lazy var brandImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .brown
        view.layer.cornerRadius = 12.5
        return view
    }()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = Constants.Image.circle_plus
        view.configuration = config
        return view
    }()
    private lazy var favButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = Constants.Image.circle_fav
        view.configuration = config
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
        backgroundColor = .red
        layer.cornerRadius = 10
        addSubview(imageView)
        addSubview(brandImage)
        addSubview(priceOffLabel)
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(favButton)
        addSubview(categoryLabel)
    }
    private func makeConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        brandImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        priceOffLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(49)
            make.height.equalTo(18)
        }
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(43)
            make.height.equalTo(12)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(34)
            make.width.equalTo(87)
            make.height.equalTo(65)
        }
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(92)
            make.width.equalTo(50)
            make.height.equalTo(17)
        }
        addButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        favButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(48)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
    }
    
    func setupCell(title: String, price: String, priceOff: String, category: String, brand: UIImage, image: UIImage){
        titleLabel.text = title
        priceLabel.text = "$ " + price
        priceOffLabel.text = priceOff + "% off"
        categoryLabel.text = category
        brandImage.image = brand
        imageView.image = image
    }
}
