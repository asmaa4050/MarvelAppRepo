//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/20/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit
import SwiftOverlays
class BaseViewController : UIViewController{
    
    var presnter : BasePresenter?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presnter = BasePresenter (viewController: self)
        
     
    }
    
    func showLodingIndicator (){
        self.showWaitOverlay()
    }
    func dismissLodingIndicator(){
        self.removeAllOverlays()
    }
}
