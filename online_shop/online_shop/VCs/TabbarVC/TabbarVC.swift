//
//  TabbarVC.swift
//  online_shop
//
//  Created by Nor1 on 16.03.2023.
//

import Foundation
import UIKit

class TabbarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizeImage()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resizeImage()
    }
    
    private func resizeImage(){
//        guard let items = tabBar.items else {return}
//        let tabWidth = tabBar.frame.width/CGFloat(items.count)
//        let tabHeight = tabBar.frame.height
//        let tabSize = CGSize(width: tabWidth, height: tabHeight)
//        var image = Constants.Image.tabbar_background
//        UIGraphicsBeginImageContext(tabSize)
//        image?.draw(in: CGRect(x: 19, y: 10, width: 40, height: 40))
//        image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        tabBar.selectionIndicatorImage = image
    }
}
