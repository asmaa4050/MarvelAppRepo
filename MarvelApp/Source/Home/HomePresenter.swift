//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/23/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation


class HomePresenter :  HomePresenterProtocol{
   
    
    var controller: HomeViewProtocol?
    
    fileprivate weak var view : HomeViewProtocol?
    fileprivate var responseModel :ResponseModel?
    fileprivate var charList = [CharDetails]()
    

    init?(view : HomeViewProtocol ) {
        self.view = view
     
    }
    
    func start (){
        fetchCharacters(limit: 20, offest: 0)
    }

    
    // this method must be in iteractor
    func fetchCharacters(limit : Int , offest : Int)  {
       controller?.showIndicator()
        NetworkClient.fetchCharachters(limit :limit , offset : offest
            ,onSuccess: { (model) in
                self.responseModel = model
                if let charList = self.responseModel?.data.results{
                    self.charList = charList
                    self.view?.fetchingDataSuccess()
                    self.controller?.dismissIndicator()
                }
                
        }) { [unowned self]  error in
            print(error)
            self.view?.handelGeneraicError(error: error)
            self.controller?.dismissIndicator()
        }
    
    }
    
    func getCharachterCount() ->Int {
        return charList.count
    }
    
    func configureCell (cell : HomeCellViewProtocol , for index : Int){
        cell.displayName(charName: charList[index].name!)
        cell.displayImage(charImagePath: (charList[index].thumbnail?.getImagePath())!)
    }
    
    func didSelectRow(index :Int) {
        view?.navigateToCharachterDetailsScreen(charObj : charList[index])
    }
    
}
