//
//  CharacterDetailsTableViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/11/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell {
  

    @IBOutlet var detailsCollectionView: UICollectionView!
  //   fileprivate var charDetailsList : [ChardetailsUiModel] = []
    @IBOutlet var comicsLabel: UILabel!
    
    @IBOutlet var collectionViewHightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
       
    }
    
    func setupCell (){
        
        comicsLabel.textColor = UIColor.red
        self.detailsCollectionView.register(UINib.init(nibName: "ComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionIdentifire")
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        detailsCollectionView.delegate = dataSourceDelegate
        detailsCollectionView.dataSource = dataSourceDelegate
        detailsCollectionView.tag = row
        detailsCollectionView.reloadData()
    
    }
}
    

    

