//
//  CharacterDetailsViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/11/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var CharDetailsTabelView: UITableView!
    fileprivate var character : CharDetails?
    fileprivate var charDetailsList : [ChardetailsUiModel] = []
    fileprivate var presenter : CharacterDetailsPresenter?
    fileprivate var headersLabelsDic =  [Int : String]()
     var charDetailsDic = [Int: [ChardetailsUiModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabelView()
        hideNavigationBar()
        setTableContentInset()
        adjustTableHeaderHight()
        setupPresenter ()
       
      
    }
   
    // MARK: setupPresenter
    func setupPresenter (){
        presenter = CharacterDetailsPresenter(controller: self)
        presenter?.fetchCharacterDeatils(charId: character?.id ?? 0)
      
    }
    
     // MARK: table view
    func setupTabelView(){
        CharDetailsTabelView.delegate = self
        CharDetailsTabelView.dataSource = self
        CharDetailsTabelView.separatorStyle = UITableViewCell.SeparatorStyle.none
       CharDetailsTabelView.registerNib(cell: CharacterDetailsTableViewCell.self)
        
       CharDetailsTabelView.register(
            CharacterHeaderTableViewCell.nib,
            forHeaderFooterViewReuseIdentifier:
            "HeaderCell"
        )
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return charDetailsDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = CharDetailsTabelView.dequeueCell() as CharacterDetailsTableViewCell
           cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.comicsLabel.text = headersLabelsDic [indexPath.row]
    
          return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
 
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = CharDetailsTabelView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as! CharacterHeaderTableViewCell
             headerCell.configureCell(character: character!)
        return headerCell
    }
    
 
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let view =  CharDetailsTabelView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as! UIView
        let size = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return size.height
    
    }
//
    
    fileprivate func setTableContentInset(){
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.CharDetailsTabelView.contentInset = UIEdgeInsets( top: -y , left: 0, bottom: 20, right: 0)
        }
    }
    fileprivate func adjustTableHeaderHight() {
        CharDetailsTabelView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: CharDetailsTabelView.frame.width, height: view.frame.height * 0.5)
    }
    
     // MARK: char details
    func setCharacterObj(character : CharDetails){
        self.character = character
    }
    
    // MARK: Update Model
    func updateUiWithModel(charDetailsDic : [Int: [ChardetailsUiModel]] , headerLabelDic : [Int : String]){
        self.charDetailsDic = charDetailsDic
        self.headersLabelsDic = headerLabelDic
        self.CharDetailsTabelView.reloadData()
    }

}

/// MARK: Collection view Delegate
extension CharacterDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      if let myarr = charDetailsDic[collectionView.tag]{
              return myarr.count
        }
        else {
            return 0
        }
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifire",
                                                         for: indexPath) as? ComicCollectionViewCell {

            charDetailsList = charDetailsDic[collectionView.tag]!
            cell.configureCell(imagePath: (charDetailsList[indexPath.row].thumbnail.getImagePath()), name: charDetailsList[indexPath.row].title)
                return cell
            
        }
        
        return UICollectionViewCell()
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemsPerRow:CGFloat = 3.5
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}


  
    
    

