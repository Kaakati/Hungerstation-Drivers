//
//  OrdersViews+Extension.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

// TableView Delegate
extension OrdersViewController : UITableViewDelegate {
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListCell
        cell.personName.text = personName[indexPath.row]
        cell.streetName.text = streetName[indexPath.row]
        return cell
    }
    
}


// Table View DataSource
extension OrdersViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personName.count
    }
    
    // Header Cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerCellId) as! TableHeaderCell
        return headerCell.contentView
    }
}


extension OrdersViewController {
    // API Handler
    func handleFetchItemsFromBackend(fromURL: String) {
        Alamofire.request(fromURL).responseArray { (response: DataResponse<[DemoDataModel]>) in
            let dataResponse = response.result.value
            
            if let dataArray = dataResponse {
                for item in dataArray {
                    
                    self.streetName.append((item.address?.street)!)
                    self.personName.append(item.name!)
                    
                    print(item.address?.street)
                    print(item.name)
                }
                self.listView.reloadData()
            }
            
        }
    }
    
    /// Seup Views.
    func setupViews() {
        // Connect to API
        handleFetchItemsFromBackend(fromURL: "https://jsonplaceholder.typicode.com/users")
        
        // Show Login View if User is not Loggedin
        Singleton.shared.logoutUser(isLoggedin: Singleton.shared.checkLoggedin , inView: self, title: "Logout?", message: "You'll no longer receive new orders.")
        
        // Remove Navigation Bar Border
        Singleton.shared.removeNavigationBarBorder(forView: self)
        
        view.backgroundColor = UIColor(hex: "ffd400")
        listView.backgroundColor = UIColor(hex: "ffd400")
        view.addSubview(listView)
        listView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        // Top Navbar Button
        let awayBtnIcon = UIImage(named: "Away")
        let logoutBtnIcon = UIImage(named: "Logout")
        let awayBtn = UIBarButtonItem(image: awayBtnIcon, style: .plain, target: self, action: #selector(handleAway))
        let logoutBtn = UIBarButtonItem(image: logoutBtnIcon, style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItems = [logoutBtn, awayBtn]
    }
    
    
    @objc func handleAway() {
        Singleton.shared.handleAwayDriver(title: "Away?", message: "You'll be set as idle for 10 minutes, you'll no longer receive new orders.", presentIn: self)
    }
    
    @objc func handleLogout() {
        Singleton.shared.logoutUser(isLoggedin: Singleton.shared.checkLoggedin , inView: self, title: "Logout?", message: "You'll no longer receive new orders.")
    }
}


