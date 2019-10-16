//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/20/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD
class BaseViewController : UIViewController{
    
    var presnter : BasePresenter?
    var hud = JGProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presnter = BasePresenter (viewController: self)
        hud = JGProgressHUD(style: .dark)
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = UIColor.clear
   
        
    }
    
    func showLodingIndicator (){
        hud.show(in: self.view)
    }
    func dismissLodingIndicator(){
        hud.dismiss()
    }
    
    func handelGenaricError(error : Error){
        let alertController = UIAlertController(title: "Error ", message:
            "some error occure at the backend system ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
