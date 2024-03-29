//
//  ImageTableViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/17/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit
import Kingfisher

class ImageTableViewCell: UITableViewCell , HomeCellViewProtocol{
    
    
    
    @IBOutlet weak var marvelImageView: UIImageView!
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (character : CharDetails){
         titleLabel.text = character.name
       
    }
    
    
    func setupCell()   {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        marvelImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.image = UIImage(named: "bg-cell-title")
    }
    func displayName(charName: String) {
        titleLabel.text = charName
    }
    
    func displayImage(charImagePath: String) {
        
            guard let url = URL(string: charImagePath) else {
                return
            }
            marvelImageView.kf.setImage(with: url)
        
    }
    
    
}
