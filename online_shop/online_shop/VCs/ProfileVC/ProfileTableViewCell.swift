//
//  ProfileTableViewCell.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    static let identifier = "ProfileCell"
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.profileCell14
        view.textAlignment = .left
        return view
    }()
    private lazy var imageCell: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var vectorCell: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.profileCell14
        view.textAlignment = .right
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(titleLabel)
        addSubview(imageCell)
        addSubview(vectorCell)
        addSubview(balanceLabel)
        backgroundColor = Constants.Color.background_white
    }
    private func makeConstraints(){
        imageCell.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(imageCell.snp.right).offset(10)
            make.width.equalTo(150)
        }
        vectorCell.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(40)
            make.centerY.equalToSuperview()
            make.width.equalTo(7)
            make.height.equalTo(14)
        }
        balanceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(40)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(50)
        }
    }
    
    func setupCell(item: Cells){
        titleLabel.text = item.title
        imageCell.image = item.image
        if let balance = item.balance {
            balanceLabel.text = "$ " + String(balance)
        }
        if item.push == true {
            vectorCell.image = Constants.Image.vector
        }
    }
}
