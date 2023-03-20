//
//  CollectionViewTop.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CollectionViewCellTop: UICollectionViewCell {
    
    static let identifier = "Details Cell Top"
    private lazy var imageViewCell: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = Constants.Color.gray_button
        return view
    }()
    private lazy var favButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.Image.favButton, for: .normal)
//        view.addTarget(self, action: #selector(favTapped), for: .touchUpInside)
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var shareButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.Image.shareButton, for: .normal)
//        view.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var imageViewLine: UIImageView = {
        let view = UIImageView()
        view.image = Constants.Image.lineButton
        view.contentMode = .scaleAspectFit
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
        clipsToBounds = true
        addSubview(imageViewCell)
        addSubview(viewContainer)
        viewContainer.addSubview(favButton)
        viewContainer.addSubview(imageViewLine)
        viewContainer.addSubview(shareButton)
    }
    private func makeConstraints(){
        imageViewCell.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(21)
        }
        viewContainer.snp.makeConstraints { make in
            make.height.equalTo(95)
            make.width.equalTo(42)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
        favButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(45)
        }
        imageViewLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(5)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(imageViewLine.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(45)
        }
    }
    
    @objc private func favTapped(){
    }
    @objc private func shareTapped(){
    }
    
    func setupCell(image: UIImage){
        imageViewCell.image = image
    }
}
