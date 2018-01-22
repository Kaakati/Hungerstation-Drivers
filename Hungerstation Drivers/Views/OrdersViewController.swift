//
//  ViewController.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    
    let cellIdentifier = "listCellId"
    let headerCellId = "headerCellID"
    
    var personName = [String]()
    var streetName = [String]()
    
    lazy var listView : UITableView = {
        let tbl = UITableView()
        tbl.register(ListCell.self, forCellReuseIdentifier: cellIdentifier)
        tbl.register(TableHeaderCell.self, forHeaderFooterViewReuseIdentifier: headerCellId)
        tbl.delegate = self
        tbl.dataSource = self
        tbl.translatesAutoresizingMaskIntoConstraints =  false
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

