//
//  APISearch.swift
//  online_shop
//
//  Created by Nor1 on 30.03.2023.
//

import Foundation
import Combine

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

//MARK: - search url
private func urlSearch() -> URL? {
    return URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")
}
