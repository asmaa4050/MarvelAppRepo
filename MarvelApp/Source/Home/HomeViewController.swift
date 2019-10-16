//
//  ViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/17/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: BaseViewController, UISearchBarDelegate, UITableViewDelegate , UITableViewDataSource{
  

    @IBOutlet weak var marvelTableView: UITableView!
    fileprivate var presenter : HomePresenter?
    var charList : [CharDetails]?
    var charSearchList : [CharDetails]?
    let charLimit = 20
    var charOffest = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        setupPresenter()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        marvelTableView.reloadData()
    }
    
    func setupPresenter()  {
        presenter = HomePresenter(controller : self)
        presenter?.fetchCharacters(limit: charLimit, offest: charOffest)
    }
    func setupTableView(){
        marvelTableView.separatorStyle = .none
        self.marvelTableView.delegate = self
        self.marvelTableView.dataSource = self
        marvelTableView.registerNib(cell: ImageTableViewCell.self)
       
    }
    
    // MARK: navigationBar
    func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = UIColor.black
        setupDefaultNavigationItems()

    }
    
    func setupDefaultNavigationItems(){
        
        let SearchBarButton = UIBarButtonItem(image: UIImage(named: "icn-nav-search" ) , style: .done, target: self, action: #selector(showSearchViewController))
        self.navigationItem.rightBarButtonItem = SearchBarButton
        let logo = UIImage(named: "icn-nav-marvel.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    // MARK: searchBar
    @objc func showSearchViewController(){
        
        performSegue(withIdentifier: "searchSegue", sender: self)
    }
  

    // MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
         return charList?.count ?? 0
    
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marvelTableView.dequeueCell() as ImageTableViewCell
        
        cell.configureCell(character : charList![indexPath.row] )
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            navigateToCharacterDetailsViewController (character : (charList?[indexPath.row])!)
        
        }
       
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = charList!.count - 1
        if indexPath.row == lastElement {
            presenter?.fetchCharacters(limit: charLimit + indexPath.row , offest: charOffest)
        }
    }
   

    // MARK: Update Model
    func updateUiWithModel(charList : [CharDetails]){
       self.charList?.removeAll()
        self.charList = charList
        self.marvelTableView.reloadData()
    }
    func updateUiWithSearchModel (charList : [CharDetails]){
        self.charSearchList?.removeAll()
        self.charSearchList = charList
        self.marvelTableView.reloadData()
    }
    
    func  navigateToCharacterDetailsViewController (character : CharDetails){
        
        if let charDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController {
             navigationItem.backBarButtonItem?.tintColor = UIColor.white
            charDetailsViewController.setCharacterObj(character: character )
            if let navigator = navigationController {
                navigator.pushViewController(charDetailsViewController, animated: true)
               
            }
        }
    }
}
