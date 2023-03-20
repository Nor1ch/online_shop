//
//  DetailsModel.swift
//  online_shop
//
//  Created by Nor1 on 20.03.2023.
//

import Foundation
import UIKit

struct DetailsModel: Decodable {
    let name: String
    let description: String
    let rating: Double
    let number_of_reviews: Int
    let price: Double
    let colors: [String]
    let image_urls: [String]
    
    static func placeholderDetails() -> DetailsModel {
        return DetailsModel(name: "", description: "", rating: 0.0, number_of_reviews: 0, price: 0.0, colors: [], image_urls: [])
    }
}

struct DetailsCompl {
    let name: String
    let description: String
    let rating: Double
    let number_of_reviews: Int
    let price: Double
    let colors: [String]
    var images: [UIImage]
    
    static func placeholderDetails() -> DetailsCompl {
        return DetailsCompl(name: "", description: "", rating: 0.0, number_of_reviews: 0, price: 0.0, colors: [], images: [])
    }
}
