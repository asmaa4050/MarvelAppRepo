//
//  BasePresenter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/20/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit
import SwiftOverlays
class BasePresenter {
    let viewController : UIViewController?
    
    init(viewController : UIViewController) {
        self.viewController = viewController
    }
    
    
   func showLodingIndicator (){
        self.viewController!.showWaitOverlay()
    }
    func dismissLodingIndicator(){
        self.viewController!.removeAllOverlays()
    }
    
    func handelGeneraicError(error : Error ){
      //   viewController?.handelGenaricError(error: error)
       
        
    }
}
