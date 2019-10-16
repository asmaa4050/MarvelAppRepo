//
//  SearchTableViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 8/19/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet var charName: UILabel!
    
    @IBOutlet var charImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(char : CharDetails){
        if let imagePath = char.thumbnail?.getImagePath(){
             charImage.kf.setImage(with: URL(string: imagePath))
            }
        
         charName.text = char.name
    
    }
    
    func setupCell(){
        charName.textColor = UIColor.white
    }
    
}
