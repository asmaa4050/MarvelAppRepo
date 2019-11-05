//
//  UserRouter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 11/4/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit
class HomeRouter : HomeRouterProtocol {
    
    weak var viewController : UIViewController?
    
    static func createModule() -> UIViewController{
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor =  HomeInteractor()
        let router = HomeRouter ()
        let presenter  = HomePresenter (view: view )//interactor: interactor , router : router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
