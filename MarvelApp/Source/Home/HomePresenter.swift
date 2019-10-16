//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/23/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
class HomePresenter : BasePresenter {
    fileprivate weak var controller : HomeViewController?
    fileprivate var responseModel :ResponseModel?
    
    
    init?(controller : HomeViewController) {
        super.init(viewController: controller)
        
        self.controller = controller
    }

    func fetchCharacters(limit : Int , offest : Int)  {
        showLodingIndicator()
        NetworkClient.fetchCharachters(limit :limit , offset : offest
            ,onSuccess: { (model) in
                self.responseModel = model
                if let charList = self.responseModel?.data.results{
                    DispatchQueue.main.async {
                        self.controller?.updateUiWithModel(charList : charList )
                        self.dismissLodingIndicator()
                    }
                }
               
            }) { [unowned self]  error in
                print(error)
                self.dismissLodingIndicator()
                self.handelGeneraicError(error : error)
                
            }
    }
    
}
