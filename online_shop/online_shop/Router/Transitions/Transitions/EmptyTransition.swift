//
//  EmptyTransition.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit

class EmptyTransition : Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
