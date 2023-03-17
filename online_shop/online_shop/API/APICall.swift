//
//  APICall.swift
//  online_shop
//
//  Created by Nor1 on 17.03.2023.
//

import Foundation
import Combine
import UIKit




func publisherImage(url: String) -> AnyPublisher<UIImage, Never> {
    guard let url = urlImage(url: url) else {
       return Just(UIImage()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { UIImage(data: $0.data) ?? UIImage() }
        .replaceError(with: UIImage())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

func publisherLatest() -> AnyPublisher<LatestContainer, Never> {
    guard let url = urlLatest() else {
        print("url error latest")
        return Just(LatestContainer.makePlaceholder()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: LatestContainer.self, decoder: JSONDecoder())
        .replaceError(with: LatestContainer.makePlaceholder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

func publisherSale() -> AnyPublisher<FlashSaleContainer, Never> {
    guard let url = urlSale() else {
        print("url error sale")
        return Just(FlashSaleContainer.makePlaceholder()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: FlashSaleContainer.self, decoder: JSONDecoder())
        .replaceError(with: FlashSaleContainer.makePlaceholder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}






//MARK: - Image url
func urlImage(url: String) -> URL? {
    return URL(string: url)
}

//MARK: - Flash sale url
func urlSale() -> URL? {
    return URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")
}

//MARK: - Latest url
func urlLatest() -> URL? {
    return URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")
}
