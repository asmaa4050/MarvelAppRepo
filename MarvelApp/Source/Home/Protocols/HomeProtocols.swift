//
//  HomeProtocols.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 10/31/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
protocol HomeViewProtocol : class {
    var presenter: HomePresenterProtocol! {get set}
    func handelGeneraicError(error : Error)
    func fetchingDataSuccess()
    func navigateToCharachterDetailsScreen(charObj : CharDetails)
    func showIndicator ()
    func dismissIndicator()
}

protocol HomeCellViewProtocol: class {
    func displayName(charName : String)
    func displayImage(charImagePath : String)
}

protocol HomePresenterProtocol: class {
    var  controller : HomeViewProtocol? {get  set}
    func fetchCharacters(limit: Int, offest: Int)
    func getCharachterCount () -> Int
    func configureCell (cell : HomeCellViewProtocol , for index : Int)
    func didSelectRow(index :Int)
    
}

protocol HomeInteractorInputProtocol {
    var presenter : HomePresenterProtocol? {get set}
     func  getCharachters(limit: Int, offest: Int)
}

protocol HomeInteractorOutPutProtocol {
    
}

protocol HomeRouterProtocol {
    
}

