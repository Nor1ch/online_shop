//
//  MainVC.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit
import Combine
import SnapKit

class MainVC: UICollectionViewController {
    
    private let viewModel: MainViewModel
    private var cancelable: Set<AnyCancellable> = []
    private var latestCompl: [LatestCompl] = []
    private var saleCompl: [SaleCompl] = []
    static let latestHeader = "latest"
    static let flashSale = "flashsale"
    
    private lazy var searchBar: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.light_gray
        view.textAlignment = .center
        view.placeholder = "What are you looking for?"
        view.textColor = Constants.Color.gray_textfield
        view.font = Constants.Font.mainTextField
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.rightViewMode = .always
        view.rightView = searchButton
        return view
    }()
    private lazy var searchButton: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 24))
        let button = UIButton()
        button.frame = CGRect(x: -10, y: 0, width: 15, height: 24)
        button.setImage(Constants.Image.lens, for: .normal)
        view.addSubview(button)
        return view
    }()
    
    private lazy var navLabel: UILabel = {
        let view = UILabel()
        let attrString = NSMutableAttributedString(string: "Trade by ", attributes: [
            .font: Constants.Font.navigationTitle as Any,
            .foregroundColor: Constants.Color.black as Any
        ])
        attrString.append(NSMutableAttributedString(string: "bata", attributes: [
            .font: Constants.Font.navigationTitle as Any,
            .foregroundColor: Constants.Color.violet_button as Any
        ]))
        view.attributedText = attrString
        return view
    }()
    
    init(viewModel: MainViewModel){
        self.viewModel = viewModel
        
        super.init(collectionViewLayout: MainVC.initFlowLayout() )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        bind()
    }
    
    private func setupViews(){
        view.backgroundColor = Constants.Color.background_white
        collectionView.register(CollectionViewCellLatest.self, forCellWithReuseIdentifier: CollectionViewCellLatest.identifier)
        collectionView.register(CollectionViewCellFlashSale.self, forCellWithReuseIdentifier: CollectionViewCellFlashSale.identifier)
        collectionView.register(CollectionViewCellCategories.self, forCellWithReuseIdentifier: CollectionViewCellCategories.identifier)
        collectionView.register(CollectionViewCellLatestHeader.self, forSupplementaryViewOfKind: MainVC.latestHeader, withReuseIdentifier: CollectionViewCellLatestHeader.identifier)
        collectionView.register(CollectionViewCellFlashSaleHeader.self, forSupplementaryViewOfKind: MainVC.flashSale, withReuseIdentifier: CollectionViewCellFlashSaleHeader.identifier)
        
        collectionView.backgroundColor = Constants.Color.background_white
        collectionView.dataSource = self
        
        navigationItem.titleView = navLabel
        view.addSubview(searchBar)
    }
    private func makeConstraints(){
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(262)
            make.height.equalTo(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    private func bind(){
        viewModel.$latestCompl
            .sink(receiveValue: { array in
                self.latestCompl = array
                self.collectionView.reloadData()
            })
            .store(in: &cancelable)
        viewModel.$saleCompl
            .sink(receiveValue: { array in
                self.saleCompl = array
                self.collectionView.reloadData()
            })
            .store(in: &cancelable)
    }
    
    static func initFlowLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize.init(widthDimension: .absolute(62), heightDimension: .absolute(65)))
                item.contentInsets.trailing = 5

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize.init(widthDimension: .estimated(1000), heightDimension: .absolute(59)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 8
                return section
            } else if sectionNumber == 1 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize.init(widthDimension: .absolute(125), heightDimension: .absolute(149)))
                item.contentInsets.trailing = 15

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize.init(widthDimension: .estimated(3000), heightDimension: .absolute(149)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: MainVC.latestHeader, alignment: .topLeading)]
                section.contentInsets.leading = 15
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize.init(widthDimension: .absolute(190), heightDimension: .absolute(221)))
                item.contentInsets.trailing = 15

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize.init(widthDimension: .estimated(3000), heightDimension: .absolute(221)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: MainVC.flashSale, alignment: .topLeading)]
                section.contentInsets.leading = 15
                return section
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return viewModel.categories.count
        case 1:
            return latestCompl.count
        case 2:
            return saleCompl.count
        default:
            return 0
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        if section == 0 {
            let item = viewModel.categories[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellCategories.identifier, for: indexPath) as? CollectionViewCellCategories
            cell?.setupCell(image: item.image, title: item.name)
            return cell ?? UICollectionViewCell()
        } else if section == 1 {
            let item = latestCompl[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellLatest.identifier, for: indexPath) as? CollectionViewCellLatest
            cell?.setupCell(title: item.name, price: item.price, category: item.category, image: item.image)
            return cell ?? UICollectionViewCell()
        } else {
            let item = saleCompl[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellFlashSale.identifier, for: indexPath) as? CollectionViewCellFlashSale
            cell?.setupCell(title: item.name, price: item.price, priceOff: String(item.discount), category: item.category, image: item.image)
            return cell ?? UICollectionViewCell()
        }
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == MainVC.latestHeader {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewCellLatestHeader.identifier, for: indexPath)
        } else {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewCellFlashSaleHeader.identifier, for: indexPath)
        }
    }
}
