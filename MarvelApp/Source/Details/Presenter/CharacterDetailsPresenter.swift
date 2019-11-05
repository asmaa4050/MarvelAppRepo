//
//  CharacterDetailsPresenter.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/14/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
class CharacterDetailsPresenter :BasePresenter{
    weak var controller : CharacterDetailsViewController?
    fileprivate var responseModel : ResponseModel?
    fileprivate var dispatchGroup = DispatchGroup ()
    var charDetailsDic = [Int: [ChardetailsUiModel]]()
    fileprivate var headerLabelDic = [Int : String]()
    

    init?(controller : CharacterDetailsViewController) {
        super.init(viewController: controller)
        
        self.controller = controller
    }
    func fetchCharacterDeatils(charId : Int)  {
        showLodingIndicator()
       fetchCharacterDetils(charId: charId, detailsType: "comics")
        fetchCharacterDetils(charId: charId, detailsType: "events")
       fetchCharacterDetils(charId: charId, detailsType: "series")
       fetchCharacterDetils(charId: charId, detailsType: "stories" )
        dispatchGroup.notify(queue: .main){
            self.controller?.updateUiWithModel(charDetailsDic : self.charDetailsDic , headerLabelDic : self.headerLabelDic )
            self.dismissLodingIndicator()
        }
    }
    
    func fetchCharacterDetils(charId : Int, detailsType : String) {
        
        dispatchGroup.enter()
        NetworkClient.fetchCharacterDetails(charId: charId , detailsType : detailsType , onSuccess: { (model) in
            self.responseModel = model
            if let charList = self.responseModel?.data.results {
                   self.mapRsponseModelToUi(charList: charList, detailsType: detailsType)
            }
            self.dispatchGroup.leave()
        }) { [unowned self]  error in
            print("")
            self.dispatchGroup.leave()
        }
    }
    func mapRsponseModelToUi(charList : [CharDetails] , detailsType : String){
        
        if (charList.count != 0 ){
            var  charListModel = [ChardetailsUiModel]()
            for char in charList {
                if let title = char.title , let thumbnail = char.thumbnail{
                    let myChar = ChardetailsUiModel(title: title , thumbnail : thumbnail)
                    charListModel.append(myChar)
                }
            }
            if !(charListModel.isEmpty){
                DispatchQueue.main.async {
                    let lastIndex = self.charDetailsDic.keys.count > 0 ? self.charDetailsDic.keys.max() : -1
                    if let lastIndex = lastIndex {
                        self.charDetailsDic[lastIndex + 1] = charListModel
                        self.headerLabelDic[lastIndex + 1] = detailsType
                    }
                }
            }
        }
        
    }
  
}
