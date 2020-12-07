//
//  ViewController.swift
//  YourDigitalLift
//
//  Created by Mac2 on 06/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit



class UserListController: UIViewController {
    
    @IBOutlet weak var userListTable: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var userDetails = [User]()
    var filterName : [User]!
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK :- Target
        
        #if Dev
            self.navigationItem.title = "YourDigitalLift"
            navigationController?.navigationBar.barTintColor = UIColor.cyan
        #else
            self.navigationItem.title = "YourDigitalLiftDemo"
            navigationController?.navigationBar.barTintColor = UIColor.orange
        #endif
        
        // MARK:- xib registerd here
        self.userListTable.register(UINib(nibName: "UserNamesCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        userListTable.delegate = self
        userListTable.dataSource = self
        
        searchBar.delegate = self
        
        let httpRequest = HttpsRequest()
        
        httpRequest.getUsers(onSuccess: { (userList) in
            self.userDetails = userList
                        DispatchQueue.main.async {
                            self.userListTable.reloadData()
                        }
        }) { (errReceived) in
            let alertController = UIAlertController(title: "", message: "Fail to Load Users Name ", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
    }
}


extension UserListController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return filterName.count
        }
        else{
            return userDetails.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserNamesCell
        if searching{
            cell.names.text = filterName[indexPath.row].name
        }
        else{
            cell.names.text = userDetails[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userVC = storyboard?.instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        if searching{
            userVC.user = filterName[indexPath.row]
        }
        else{
        userVC.user = userDetails[indexPath.row]
        }
        self.navigationController?.pushViewController(userVC, animated: true)
    }
}
extension UserListController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterName = userDetails.filter({$0.name.prefix(searchText.count) == searchText})
        searching = true
        userListTable.reloadData()
   
    }
}













