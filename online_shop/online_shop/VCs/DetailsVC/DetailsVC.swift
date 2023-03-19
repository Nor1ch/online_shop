//
//  DetailsVC.swift
//  online_shop
//
//  Created by Nor1 on 19.03.2023.
//

import Foundation
import UIKit

class DetailsVC: UIViewController {
    
    private let viewModel: DetailsViewModel
    
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
    }
    
    private func setupView(){
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(mainCollectionView)
        mainCollectionView.dataSource = self
//        mainCollectionView.register(nil, forCellWithReuseIdentifier: "asd")
    }
    private func makeConstraints(){
        mainCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }
    
//MARK: - FlowLayout init
    private lazy var mainCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: flowLayout)
        
        return view
    }()
}

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "asd", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
