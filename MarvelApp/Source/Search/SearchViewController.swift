//
//  SearchViewController.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 8/18/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController , UISearchBarDelegate , UITableViewDataSource , UITableViewDelegate{
    
  
    fileprivate var presenter : SearchPresenter?
     var charSearchList : [CharDetails] = []
    
    @IBOutlet var searchTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenter()
        setupNavigationBar()
        setupTableView()
        
    }
    // MARK: setup views
    
    func setupPresenter(){
         presenter = SearchPresenter(controller : self)
    }
    func setupTableView(){
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.separatorStyle = .none
        searchTableView.tableFooterView = UIView()
        searchTableView.backgroundColor = UIColor(rgb: 0x282C2F)
        searchTableView.registerNib(cell: SearchTableViewCell.self)
        
        
    }
    
    // MARK: navigationBar
    
    func setupNavigationBar(){
        let searchBar = UISearchBar(frame: CGRect.zero)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor.red
        self.navigationItem.titleView = searchBar
        self.navigationItem.hidesBackButton = true
    }
    
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text{
            if validateEmptyText(text: searchText){
                presenter?.searchCharachter(withName: searchText)
            }
            else{
                // H        showWarrningMessage()
            }
        }
        
    }
 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         presenter?.searchCharachter(withName: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func validateEmptyText(text : String) -> Bool{
        if text != "" {
            return true
        }
        return false
    }
    
   
    // MARK: table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  charSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueCell() as SearchTableViewCell
        cell.selectionStyle = .none
        cell.configureCell(char : charSearchList[indexPath.row] )
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(rgb: 0x3C3F42)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateToCharacterDetailsViewController (character : (charSearchList[indexPath.row]))
        
    }
    
    func  navigateToCharacterDetailsViewController (character : CharDetails){
        
        if let charDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController {
            charDetailsViewController.setCharacterObj(character: character )
           navigationItem.backBarButtonItem?.tintColor = UIColor.white
            if let navigator = navigationController {
                navigator.pushViewController(charDetailsViewController, animated: true)
            }
        }
    }
    
    func updateUiWithSearchModel (charList : [CharDetails]){
        self.charSearchList = charList
        searchTableView.reloadData()
        
    }

    

}



