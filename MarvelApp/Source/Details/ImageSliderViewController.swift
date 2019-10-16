//
//  ImageSliderViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 8/20/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit

import ScalingCarousel
class ImageSliderViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet var photosCarouselView: ScalingCarouselView!
    
    @IBOutlet var closeButton: UIButton!
    var carousalViewWidth : CGFloat?
    var carousalViewHight : CGFloat?
    fileprivate var photosList = [ChardetailsUiModel]()
    fileprivate var presenter  : ImageSliderPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
         setupPresenter()
         setupCarouselView()
         setupViews()
       
    }
    
    override func viewDidLayoutSubviews() {
        carousalViewWidth = photosCarouselView.frame.width
        carousalViewHight = photosCarouselView.frame.height
        
    }
    
    func setupPresenter (){
      // H   presenter = ImageSliderPresenter(viewController: self)
    }
    
    func setupViews(){
        closeButton.setImage(UIImage(named: "icn-nav-close-white"), for: .normal)
        closeButton.setTitle("", for: .normal)
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)    }
    
    func setupCarouselView(){
        photosCarouselView.delegate = self
        photosCarouselView.dataSource = self
         self.photosCarouselView.register(UINib.init(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageViewCell")
    
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      if  let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell",
                                                         for: indexPath) as? ImageViewCell{
        cell.configureCell(url: photosList[indexPath.row].thumbnail.getImagePath(), description: photosList[indexPath.row].title, currentPage: "\(indexPath.row + 1) / \(photosList.count)")
        return cell
        
        }
        
    return UICollectionViewCell()
    }
    
    func setPhotosList (photosList : [ChardetailsUiModel]){
        self.photosList = photosList
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 3.5
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow)
        let itemHeight = collectionView.bounds.height 
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
}
