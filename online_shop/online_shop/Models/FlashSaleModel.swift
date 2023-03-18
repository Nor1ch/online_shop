//
//  FlashSaleModel.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import UIKit

//struct FlashSaleModel {
//    let title: String
//    let price: String
//    let category: String
//    let brand: UIImage
//    let image: UIImage
//    let priceOff: String
//}

struct FlashSaleContainer: Decodable {
    
        struct FlashSaleModel: Decodable {
            let category: String
            let name: String
            let price: Double
            let discount: Int
            let image_url: String
        }
        
    let flash_sale: [FlashSaleModel]
    
    static func makePlaceholder() -> FlashSaleContainer {
        return FlashSaleContainer(flash_sale: [])
    }
}

struct SaleCompl {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let image: UIImage
}
