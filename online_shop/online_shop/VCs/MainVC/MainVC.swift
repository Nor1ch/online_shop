//
//  MainVC.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit
import SnapKit

class MainVC: UICollectionViewController {
    
    private let viewModel: MainViewModel
    static let latestHeader = "latest"
    static let flashSale = "flashsale"
    
    private lazy var searchBar: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
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
        title = "Trade by bata"
        
        view.addSubview(searchBar)
    }
    private func makeConstraints(){
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
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
            return viewModel.latest.count
        case 2:
            return viewModel.flashSale.count
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
            let item = viewModel.latest[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellLatest.identifier, for: indexPath) as? CollectionViewCellLatest
            cell?.setupCell(title: item.title, price: item.price, category: item.category, image: item.image)
            return cell ?? UICollectionViewCell()
        } else {
            let item = viewModel.flashSale[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellFlashSale.identifier, for: indexPath) as? CollectionViewCellFlashSale
            cell?.setupCell(title: item.title, price: item.price, priceOff: item.priceOff, category: item.category, brand: item.brand, image: item.image)
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
