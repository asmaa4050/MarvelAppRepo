//
//  CharacterHeaderTableViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/11/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet var charImageView: UIImageView!
    
    @IBOutlet var NameLabel: UILabel!
    
    @IBOutlet var charNameLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var charDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
      
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    func setupCell(){
        NameLabel.text = "Name"
        descriptionLabel.text = "Description"
        NameLabel.textColor = UIColor.red
        descriptionLabel.textColor = UIColor.red
        NameLabel.font = UIFont.systemFont(ofSize: 15.0)
        descriptionLabel.font = UIFont.systemFont(ofSize: 15.0)
        charNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        charDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        charDescriptionLabel.textColor = UIColor.white
        charDescriptionLabel.adjustsFontSizeToFitWidth = true
        charDescriptionLabel.minimumScaleFactor = 0.5
        charNameLabel.textColor = UIColor.white
        charImageView.contentMode = .scaleToFill
    }
    
    func configureCell(character : CharDetails){
        charNameLabel.text = character.name
        charDescriptionLabel.text = character.description
        if let imageFullPath = character.thumbnail?.getImagePath(){
            guard let url = URL(string: imageFullPath) else {
                return
            }
        charImageView.kf.setImage(with: url)
    }
    }
}
