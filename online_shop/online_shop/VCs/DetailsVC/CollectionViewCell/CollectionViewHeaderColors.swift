//
//  CollectionViewHeaderColors.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CollectionViewHeaderColors: UICollectionReusableView {
    static let identifier = "HeaderCollectionViewColors"
    
    private lazy var colorsTitle: UILabel = {
        let view = UILabel()
        view.text = "Color:"
        view.font = Constants.Font.descriptionHeader10
        view.textColor = Constants.Color.gray
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews(){
        addSubview(colorsTitle)
    }
    private func makeConstraints(){
        colorsTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
