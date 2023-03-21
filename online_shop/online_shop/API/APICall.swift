//
//  APICall.swift
//  online_shop
//
//  Created by Nor1 on 17.03.2023.
//

import Foundation
import Combine
import UIKit


func publisherMerge() -> AnyPublisher<([LatestCompl],[SaleCompl]),Never> {
    Publishers.Zip(publisherLatestCompl(),
                   publisherSaleCompl())
        .eraseToAnyPublisher()
}
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

func publisherWords(word: String) -> AnyPublisher<SearchModel, Never> {
    guard let url = urlSearch() else {
        return Just(SearchModel(words: [])).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map {$0.data}
        .decode(type: SearchModel.self, decoder: JSONDecoder())
        .replaceError(with: SearchModel(words: []))
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}
//MARK: - private publishers

private func publisherDetails() -> AnyPublisher<DetailsModel, Never> {
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


private func publisherLatestCompl() -> AnyPublisher<[LatestCompl], Never> {
    publisherLatest()
        .map { container in
            Publishers.MergeMany(container.latest.map({ model in
                publisherImage(url: model.image_url)
                    .map { image in
                        LatestCompl(category: model.category, name: model.name, price: model.price, image: image)
                    }
            }))
                .collect(container.latest.count)
            
        }
        .switchToLatest()
        .eraseToAnyPublisher()
}

private func publisherSaleCompl() -> AnyPublisher<[SaleCompl], Never> {
    publisherSale()
        .map { container in
            Publishers.MergeMany(container.flash_sale.map({ model in
                publisherImage(url: model.image_url)
                    .map { image in
                        SaleCompl(category: model.category, name: model.name, price: model.price, discount: model.discount, image: image)
                    }
            }))
                .collect(container.flash_sale.count)
        }
        .switchToLatest()
        .eraseToAnyPublisher()
}


private func publisherImage(url: String) -> AnyPublisher<UIImage, Never> {
    guard let url = urlImage(url: url) else {
       return Just(UIImage()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { UIImage(data: $0.data) ?? UIImage() }
        .replaceError(with: UIImage())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}
private func publisherImages(urls: [String]) -> AnyPublisher<[UIImage], Never> {
    Publishers.MergeMany(urls.map{string in
        publisherImage(url: string)
    })
        .collect(urls.count)
        .eraseToAnyPublisher()
}

private func publisherLatest() -> AnyPublisher<LatestContainer, Never> {
    guard let url = urlLatest() else {
        return Just(LatestContainer.makePlaceholder()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: LatestContainer.self, decoder: JSONDecoder())
        .replaceError(with: LatestContainer.makePlaceholder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

private func publisherSale() -> AnyPublisher<FlashSaleContainer, Never> {
    guard let url = urlSale() else {
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
private func urlImage(url: String) -> URL? {
    return URL(string: url)
}

//MARK: - Flash sale url
private func urlSale() -> URL? {
    return URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")
}

//MARK: - Latest url
private func urlLatest() -> URL? {
    return URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")
}
//MARK: - details url
private func urlDetails() -> URL? {
    return URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")
}
//MARK: - search url
private func urlSearch() -> URL? {
    return URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")
}
