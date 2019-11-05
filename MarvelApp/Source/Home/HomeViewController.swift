//
//  ViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 6/17/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController:  BaseViewController, HomeViewProtocol{
  
   
    var presenter: HomePresenterProtocol!
    @IBOutlet weak var marvelTableView: UITableView!
   //  fileprivate var presenter : HomePresenter?
    
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
        presenter = HomePresenter (view: self)
        presenter.fetchCharacters(limit: charLimit, offest: 0)
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
  
    func handelGeneraicError(error: Error) {
        handelGeneraicError(error: error)
    }
    
    func fetchingDataSuccess() {
        marvelTableView.reloadData()
    }
    func showIndicator() {
        showLodingIndicator()
    }
    func dismissIndicator() {
        dismissLodingIndicator()
    }
    
    func navigateToCharachterDetailsScreen(charObj: CharDetails) {
        if let charDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController {
            navigationItem.backBarButtonItem?.tintColor = UIColor.white
            charDetailsViewController.setCharacterObj(character: charObj )
            if let navigator = navigationController {
                navigator.pushViewController(charDetailsViewController, animated: true)
                
            }
        }
    }
    
}
extension HomeViewController :  UISearchBarDelegate, UITableViewDelegate , UITableViewDataSource  {
 
    // MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter?.getCharachterCount() ?? 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marvelTableView.dequeueCell() as ImageTableViewCell
        presenter?.configureCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.didSelectRow(index: indexPath.row)
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = (presenter?.getCharachterCount())! - 1
        if indexPath.row == lastElement {
            presenter?.fetchCharacters(limit: charLimit + indexPath.row , offest: charOffest)
        }
    }
    
}
