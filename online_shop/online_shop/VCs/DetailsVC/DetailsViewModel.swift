//
//  DetailsViewModel.swift
//  online_shop
//
//  Created by Nor1 on 19.03.2023.
//

import Foundation
import Combine


class DetailsViewModel{
    
    @Published var model: DetailsCompl = DetailsCompl.placeholderDetails()
    
    private var cancelable: AnyCancellable? = nil
    
    private let router: MainRouter
    init(router: MainRouter){
        self.router = router
        
       cancelable = publisherDetailsWithImages()
            .sink { modelDetails in
                self.model = modelDetails
            }
    }
    
}
