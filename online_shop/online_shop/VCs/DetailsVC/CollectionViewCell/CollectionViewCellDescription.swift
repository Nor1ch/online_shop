//
//  CollectionViewCellDescription.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import SnapKit
import UIKit

class CollectionViewCellDescription: UICollectionViewCell {
    static let identifier = "Cell Description"
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.descriptionTitle17
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.descriptionText9
        view.textColor = Constants.Color.gray
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        return view
    }()
    private lazy var starImageView: UIImageView = {
        let view = UIImageView()
        view.image = Constants.Image.star
        return view
    }()
    private lazy var raitingLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.descriptionRaiting9
        return view
    }()
    private lazy var viewsLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.descriptionViews9
        view.textColor = Constants.Color.gray
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.descriptionPrice13
        view.textAlignment = .right
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
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(starImageView)
        addSubview(raitingLabel)
        addSubview(viewsLabel)
        addSubview(priceLabel)
    
    }
    private func makeConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.lessThanOrEqualTo(100)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        starImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        raitingLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalTo(starImageView.snp.right).offset(2)
            make.height.equalTo(11)
            make.width.equalTo(15)
        }
        viewsLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalTo(raitingLabel.snp.right).offset(2)
            make.height.equalTo(11)
            make.width.equalTo(130)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.left.equalTo(titleLabel.snp.right)
        }
    }
    
    func setupCell(title: String, description: String, raiting: Double, views: Int, price: Double){
        titleLabel.text = title
        descriptionLabel.text = description
        raitingLabel.text = "\(raiting)"
        viewsLabel.text = "(" + "\(views)" + " reviews)"
        priceLabel.text = "$ " + "\(price)"
    }
}
