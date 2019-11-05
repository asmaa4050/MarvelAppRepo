//
//  CharachterDetailsProtocol.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 11/4/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation

protocol CharacterDetailsViewProtocol :class {
    var presenter :CharDetailsPresenterProtocol!{get set}
    func fetchingDataSuccess ()
    func showIndicator()
    func dismissIndicator()
    
}
protocol CharDetailsPresenterProtocol :class {
    var controller :CharacterDetailsViewProtocol?{get set}
    func  fetchCharacterDeatils(charId : Int)
    func  getCharDetailsDicCount()->Int
    func  getCollectionviewItemsCount(collectionViewTag : Int) -> Int
    func  configureCollectionViewCell(cell : ComicCollectionViewCell , tag : Int , indexPath :Int)
    func configureHeaderLabel (cell :CharacterDetailsTableViewCell , indexPath :Int)
    func getCharDetailsList (tag : Int) -> [ChardetailsUiModel]
    
}
protocol DetailsCollectionViewCellProtocol :class {
    func configureCell (imagePath : String , name :String)
}
