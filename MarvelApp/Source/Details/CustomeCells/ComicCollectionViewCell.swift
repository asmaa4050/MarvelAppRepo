//
//  ComicCollectionViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/21/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet var comicImage: UIImageView!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell(){
        name.textColor = UIColor.white
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.font = UIFont.systemFont(ofSize: 15.0)
        name.numberOfLines = 4
        comicImage.contentMode = .scaleAspectFit
        
    

    }
    func configureCell(imagePath : String, name : String){
        guard let url = URL(string: imagePath) else {
            return
        }
        
        comicImage.kf.setImage(with: url)
        self.name.text = name
        
    }

}
