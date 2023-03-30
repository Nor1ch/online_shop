//
//  APIDetails.swift
//  online_shop
//
//  Created by Nor1 on 30.03.2023.
//

import Foundation
import Combine
import UIKit


func publisherDetailsWithImages() -> AnyPublisher<DetailsCompl,Never> {
    publisherDetails()
        .flatMap { model in
            publisherImages(urls: model.image_urls)
                .map { images in
                    DetailsCompl(name: model.name, description: model.description, rating: model.rating, number_of_reviews: model.number_of_reviews, price: model.price, colors: model.colors, images: images)
        }
    }
        .eraseToAnyPublisher()
}

fileprivate func publisherImages(urls: [String]) -> AnyPublisher<[UIImage], Never> {
    Publishers.MergeMany(urls.map{string in
        publisherImage(url: string)
    })
        .collect(urls.count)
        .eraseToAnyPublisher()
}

fileprivate func publisherImage(url: String) -> AnyPublisher<UIImage, Never> {
    guard let url = urlImage(url: url) else {
       return Just(UIImage()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { UIImage(data: $0.data) ?? UIImage() }
        .replaceError(with: UIImage())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}
fileprivate func publisherDetails() -> AnyPublisher<DetailsModel, Never> {
    guard let url = urlDetails() else {
        return Just(DetailsModel.placeholderDetails()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: DetailsModel.self, decoder: JSONDecoder())
        .replaceError(with: DetailsModel.placeholderDetails())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

//MARK: - details url
fileprivate func urlDetails() -> URL? {
    return URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")
}
//MARK: - Image url
fileprivate func urlImage(url: String) -> URL? {
    return URL(string: url)
}
