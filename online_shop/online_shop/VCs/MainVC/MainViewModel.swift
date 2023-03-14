//
//  MainViewModel.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation

class MainViewModel {
    let categories: [CategoryModel] = [
        CategoryModel(image: Constants.Image.phones!, name: "Phones"),
        CategoryModel(image: Constants.Image.headphones!, name: "Headphones"),
        CategoryModel(image: Constants.Image.games!, name: "Games"),
        CategoryModel(image: Constants.Image.cars!, name: "Cars"),
        CategoryModel(image: Constants.Image.furniture!, name: "Furniture"),
        CategoryModel(image: Constants.Image.kids!, name: "Kids"),
        
        CategoryModel(image: Constants.Image.phones!, name: "Phones"),
        CategoryModel(image: Constants.Image.headphones!, name: "Headphones"),
        CategoryModel(image: Constants.Image.games!, name: "Games"),
        CategoryModel(image: Constants.Image.cars!, name: "Cars"),
        CategoryModel(image: Constants.Image.furniture!, name: "Furniture"),
        CategoryModel(image: Constants.Image.kids!, name: "Kids")
    ]
    
    let latest: [LatestModel] = [
        LatestModel(title: "Play Station 5 console", price: "50000", category: "Games", image: Constants.Image.background!),
        LatestModel(title: "Play Station 5 console", price: "40000", category: "Games", image: Constants.Image.background3!),
        LatestModel(title: "Samsung", price: "5000", category: "Games", image: Constants.Image.background4!),
        
        LatestModel(title: "Play Station 5 console", price: "50000", category: "Games", image: Constants.Image.background!),
        LatestModel(title: "Play Station 5 console", price: "40000", category: "Games", image: Constants.Image.background3!),
        LatestModel(title: "Samsung", price: "5000", category: "Games", image: Constants.Image.background4!)
    ]
    
    let flashSale: [FlashSaleModel] = [
        FlashSaleModel(title: "New balance sneakers", price: "12000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background1!, priceOff: "30"),
        FlashSaleModel(title: "New balance sneakers", price: "15000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background2!, priceOff: "30"),
        
        FlashSaleModel(title: "New balance sneakers", price: "12000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background1!, priceOff: "30"),
        FlashSaleModel(title: "New balance sneakers", price: "15000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background2!, priceOff: "30"),
        FlashSaleModel(title: "New balance sneakers", price: "12000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background1!, priceOff: "30"),
        FlashSaleModel(title: "New balance sneakers", price: "15000", category: "Kids", brand: Constants.Image.brand!, image: Constants.Image.background2!, priceOff: "30")
    ]
    private let router: MainRouter
    
    init(router: MainRouter){
        self.router = router
    }
}
