//
//  LatestModel.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import UIKit

//struct LatestModel {
//    let title: String
//    let price: String
//    let category: String
//    let image: UIImage
//}

struct LatestContainer: Decodable{
    
    struct LatestModel: Decodable {
        let category: String
        let name: String
        let price: Double
        let image_url: String
    }
    
    let latest: [LatestModel]
    
    static func makePlaceholder() -> LatestContainer {
        return LatestContainer(latest: [])
    }
}

struct LatestCompl {
    let category: String
    let name: String
    let price: Double
    let image: UIImage
}
