//
//  ImageViewCell.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 8/25/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit
import ScalingCarousel

class ImageViewCell:  ScalingCarouselCell{
    
    @IBOutlet var photo: UIImageView!

    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var currentPagelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
      
    }
    func setupCell(){
        photo.contentMode = .scaleAspectFill
        descriptionLabel.textColor = UIColor.white
        currentPagelabel.textColor = UIColor.white
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
    }
    func configureCell(url :String ,  description :String , currentPage : String){
        
        descriptionLabel.text = description
        currentPagelabel.text = currentPage 
        
        guard let url = URL(string: url) else {
            return
        }
        
        photo.kf.setImage(with: url)
    }
    

}
