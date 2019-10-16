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
        
        NameLabel.textColor = UIColor.red
        descriptionLabel.textColor = UIColor.red
        NameLabel.font = UIFont.systemFont(ofSize: 15.0)
        descriptionLabel.font = UIFont.systemFont(ofSize: 15.0)
        charNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        charDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        charDescriptionLabel.textColor = UIColor.white
        //        charDescriptionLabel.numberOfLines = 0
        //        charDescriptionLabel.lineBreakMode = .byWordWrapping
        //        charDescriptionLabel.sizeToFit()
        // charDescriptionLabel.adjustsFontSizeToFitWidth = true
        // charDescriptionLabel.minimumScaleFactor = 0.7
        charNameLabel.textColor = UIColor.white
        charImageView.contentMode = .scaleToFill
    }
    
    func configureCell(character : CharDetails){
        let charName =  character.name
        let charDesc = character.description
        if charName == "" || charName == nil {
            NameLabel.isHidden = true
            charNameLabel.isHidden = true
        }
        else{
            NameLabel.text = "Name"
            charNameLabel.text = character.name
        }
        
        if charDesc == "" || charDesc == nil{
            descriptionLabel.isHidden = true
            charDescriptionLabel.isHidden = true
        } else{
            descriptionLabel.text = "Description"
            charDescriptionLabel.text = charDesc
            
        }
        if let imageFullPath = character.thumbnail?.getImagePath(){
            guard let url = URL(string: imageFullPath) else {
                return
            }
            charImageView.kf.setImage(with: url)
            
        }
    }
}
