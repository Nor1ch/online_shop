//
//  MainViewModel.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import Combine

class MainViewModel {
    let categories: [CategoryModel] = [
        CategoryModel(image: Constants.Image.phones!, name: "Phones"),
        CategoryModel(image: Constants.Image.headphones!, name: "Headphones"),
        CategoryModel(image: Constants.Image.games!, name: "Games"),
        CategoryModel(image: Constants.Image.cars!, name: "Cars"),
        CategoryModel(image: Constants.Image.furniture!, name: "Furniture"),
        CategoryModel(image: Constants.Image.kids!, name: "Kids")
    ]

    @Published var latestCompl: [LatestCompl] = []
    @Published var saleCompl: [SaleCompl] = []
    private var cancelable: AnyCancellable? = nil
    
    typealias Routes = ProfileRoute & DetailsRoute
    private let router: Routes
    
    init(router: Routes){
        self.router = router
        
        cancelable = publisherMerge()
            .sink(receiveValue: { (first, second) in
                self.latestCompl = first
                self.saleCompl = second
            })
    }
    
    func openProfile(){
        router.openProfile()
    }
    func openDetails(){
        router.openDetails()
    }
}
