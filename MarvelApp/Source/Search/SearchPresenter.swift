//
//  SearchPresenter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 8/18/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
class SearchPresenter: BasePresenter {
    fileprivate weak var controller : SearchViewController?
    fileprivate var responseModel :ResponseModel?

    
    init?(controller : SearchViewController) {
        super.init(viewController: controller)
        
        self.controller = controller
    }
    
 func searchCharachter(withName searchText:String){
      // H   showLodingIndicator()
        NetworkClient.searchCharachter(searchText : searchText,onSuccess: { (model) in
            self.responseModel = model
            if let charList = self.responseModel?.data.results{
                DispatchQueue.main.async {
                    self.controller?.updateUiWithSearchModel(charList : charList )
               // H      self.dismissLodingIndicator()
                }
            }
            
        }) { [unowned self]  error in
            print("")
        }
    }
}
