//
//  DetailsVC.swift
//  online_shop
//
//  Created by Nor1 on 19.03.2023.
//

import Foundation
import UIKit
import Combine


class DetailsVC: UIViewController {
    static let headerColors = "Colors"
    private let viewModel: DetailsViewModel
    private var selectedColor = 0
    private var selectedImage = 0
    
    
    private var model: DetailsCompl = DetailsCompl.placeholderDetails()
    private var cancelable: Set<AnyCancellable> = []
    
    
    private lazy var placeholderToBuy: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Color.light_black
        view.layer.cornerRadius = 20
        return view
    }()
    private lazy var plusButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Color.violet_button
        config.background.cornerRadius = 10
        config.cornerStyle = .fixed
        config.image = UIImage(systemName: "plus")
        view.configuration = config
        return view
    }()
    private lazy var minusButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Color.violet_button
        config.background.cornerRadius = 10
        config.cornerStyle = .fixed
        config.image = UIImage(systemName: "minus")
        view.configuration = config
        return view
    }()
    private lazy var addButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Color.violet_button
        config.background.cornerRadius = 15
        config.cornerStyle = .fixed
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.descriptionButton8 as Any,
            .foregroundColor : Constants.Color.white as Any
        ]
        let title = "ADD TO CART"
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        view.configuration = config
        return view
    }()
    private lazy var quantityLabel: UILabel = {
        let view = UILabel()
        view.text = "Quantity:"
        view.font = Constants.Font.descriptionQuantity9
        view.textColor = Constants.Color.gray
        return view
    }()
    init(viewModel: DetailsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
        bind()
    }
    private func bind(){
        viewModel.$model
            .sink { model in
                self.model = model
                self.mainCollectionView.reloadData()
            }
            .store(in: &cancelable)
    }
    private func setupView(){
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(mainCollectionView)
        view.addSubview(placeholderToBuy)
        
        mainCollectionView.isScrollEnabled = false
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.register(CollectionViewCellTop.self, forCellWithReuseIdentifier: CollectionViewCellTop.identifier)
        mainCollectionView.register(CollectionViewCellBottom.self, forCellWithReuseIdentifier: CollectionViewCellBottom.identifier)
        mainCollectionView.register(CollectionViewCellDescription.self, forCellWithReuseIdentifier: CollectionViewCellDescription.identifier)
        mainCollectionView.register(CollectionViewCellColors.self, forCellWithReuseIdentifier: CollectionViewCellColors.identifier)
        mainCollectionView.register(CollectionViewHeaderColors.self, forSupplementaryViewOfKind: DetailsVC.headerColors, withReuseIdentifier: CollectionViewHeaderColors.identifier)
        
        placeholderToBuy.addSubview(plusButton)
        placeholderToBuy.addSubview(quantityLabel)
        placeholderToBuy.addSubview(minusButton)
        placeholderToBuy.addSubview(addButton)
    }
    private func makeConstraints(){
        mainCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(placeholderToBuy.snp.top)
        }
        placeholderToBuy.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        minusButton.snp.makeConstraints { make in
            make.width.equalTo(47)
            make.height.equalTo(27)
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(quantityLabel.snp.bottom).offset(5)
        }
        plusButton.snp.makeConstraints { make in
            make.width.equalTo(47)
            make.height.equalTo(27)
            make.left.equalTo(minusButton.snp.right).offset(20)
            make.top.equalTo(quantityLabel.snp.bottom).offset(5)
        }
        quantityLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(190)
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(20)
        }
    }
    
//MARK: - FlowLayout init images
    private lazy var mainCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
                if sectionNumber == 0 {
                    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    item.contentInsets.trailing = 10
                    item.contentInsets.leading = 15
            
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .paging
                    return section
                        } else if sectionNumber == 1{
                            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(83), heightDimension: .absolute(45)))
                            item.contentInsets.trailing = 10
                            item.contentInsets.leading = 10
            
                            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(3000), heightDimension: .fractionalHeight(0.15)), subitems: [item])
            
                            let section = NSCollectionLayoutSection(group: group)
                            section.contentInsets.top = 40
                            section.orthogonalScrollingBehavior = .continuous
                            return section
                                } else if sectionNumber == 2 {
                                    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                                    item.contentInsets.trailing = 10
                                    item.contentInsets.leading = 10
                
                                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25)), subitems: [item])
                                    let section = NSCollectionLayoutSection(group: group)
                                    section.orthogonalScrollingBehavior = .paging
                                    return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(65), heightDimension: .absolute(35)))
                item.contentInsets.trailing = 10
                item.contentInsets.leading = 10
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(3000), heightDimension: .fractionalHeight(0.1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [ NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(25)), elementKind: DetailsVC.headerColors, alignment: .topLeading)]
                section.contentInsets.top = 5
                section.contentInsets.leading = 15
                return section
            }
        }
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: flowLayout)
        
        return view
    }()
}

//MARK: - data source
extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model.images.count
        case 1:
            return model.images.count
        case 2:
            return 1
        case 3:
            return model.colors.count
        default:
            return 15
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let item = model.images[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTop.identifier, for: indexPath) as? CollectionViewCellTop
            cell?.setupCell(image: item)
            return cell ?? UICollectionViewCell()
        case 1:
            let item = model.images[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellBottom.identifier, for: indexPath) as? CollectionViewCellBottom
            cell?.backgroundColor = selectedImage == indexPath.row ? Constants.Color.gray : Constants.Color.background_white
            cell?.setupCell(image: item)
            return cell ?? UICollectionViewCell()
        case 2:
            let item = model
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellDescription.identifier, for: indexPath) as? CollectionViewCellDescription
            cell?.setupCell(title: item.name, description: item.description, raiting: item.rating, views: item.number_of_reviews, price: item.price)
            return cell ?? UICollectionViewCell()
        case 3:
            let item = model.colors[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellColors.identifier, for: indexPath) as? CollectionViewCellColors
            cell?.backgroundColor = selectedColor == indexPath.row ? Constants.Color.gray : Constants.Color.background_white
            cell?.setupCell(color: item)
            return cell ?? UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: DetailsVC.headerColors, withReuseIdentifier: CollectionViewHeaderColors.identifier, for: indexPath)
    }
}
//MARK: - delegate
extension DetailsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            selectedImage = indexPath.row
            collectionView.reloadData()
        case 1:
            collectionView.scrollToItem(at: IndexPath(row: indexPath.row, section: 0), at: .centeredHorizontally, animated: true)
        case 3:
            selectedColor = indexPath.row
            collectionView.reloadData()
        default:
            print("")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedImage = indexPath.row
            collectionView.reloadData()
        }
    }
}
