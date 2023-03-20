//
//  CollectionViewCellColors.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import UIKit

class CollectionViewCellColors: UICollectionViewCell {
    static let identifier = "Cell Colors"
    
    private let colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
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
        addSubview(colorView)
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = Constants.Color.background_white
    }
    private func makeConstraints(){
        colorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(3)
            make.left.equalToSuperview().offset(3)
            make.right.equalToSuperview().inset(3)
            make.bottom.equalToSuperview().inset(3)
        }
    }
    func setupCell(color: String){
        let hexColor = UIColor().colorWithHex(hex: color)
        colorView.backgroundColor = hexColor
    }
}
