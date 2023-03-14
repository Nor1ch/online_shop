//
//  CollectionViewCellHeader.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit

class CollectionViewCellLatestHeader: UICollectionReusableView {
    static let identifier = "HeaderCollectionViewLatest"
    
    private lazy var latestTitle: UILabel = {
        let view = UILabel()
        view.text = "Latest"
        view.font = Constants.Font.titleHeader15
        return view
    }()
    private lazy var viewAllButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.buttonHeader9 as Any,
            .foregroundColor : Constants.Color.gray as Any
        ]
        let title = "View all"
        config.titleAlignment = .center
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.cornerStyle = .medium
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews(){
        addSubview(latestTitle)
        addSubview(viewAllButton)
    }
    private func makeConstraints(){
        latestTitle.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
        viewAllButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(11)
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(15)
        }
    }
}
