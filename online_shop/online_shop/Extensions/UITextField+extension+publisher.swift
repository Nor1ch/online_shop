//
//  UITextField+extension+publisher.swift
//  online_shop
//
//  Created by Nor1 on 21.03.2023.
//

import Foundation
import UIKit
import Combine

extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap {$0.object as? UITextField}
            .compactMap {$0.text}
            .eraseToAnyPublisher()
    }
}
