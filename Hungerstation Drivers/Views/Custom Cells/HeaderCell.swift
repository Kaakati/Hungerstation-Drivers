//
//  HeaderCell.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import UIKit

enum Satisfaction : String {
    case Sad = "Sad Customers 😐"
    case Nutral = "Nutral Customers 😊"
    case Happy = "Happy Customers 😀"
    case Satisfied = "Satisfied Customers 😁"
}

// Header Cell
class TableHeaderCell : UITableViewHeaderFooterView {
    
    let headerDriverNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = Singleton.shared.HungerstationBoldFont
        lbl.text = "Driver".uppercased()
        return lbl
    }()
    
    let headerDriverNameText : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Mohamad Kaakati"
        return lbl
    }()
    
    let headerTotalOrdersLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Delivered".uppercased()
        lbl.font = Singleton.shared.HungerstationBoldFont
        return lbl
    }()
    
    let headerTotalOrdersText : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "18 Orders"
        return lbl
    }()
    
    let headerOverallSatisfactionLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = Singleton.shared.HungerstationBoldFont
        lbl.text = "Satisfaction Rating"
        return lbl
    }()
    
    let headerOverallSatisfaction : UILabel = {
        let lbl = UILabel()
        lbl.text = Satisfaction.Satisfied.rawValue
        return lbl
    }()
    
    let headerTotalCollectedLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Collected Money"
        lbl.font = Singleton.shared.HungerstationBoldFont
        return lbl
    }()
    
    let headerTotalCollectedText : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "289 SAR"
        return lbl
    }()
    
    let ratingImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "four-and-half")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    //
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // Setup Views
    func setupViews() {
        contentView.backgroundColor = UIColor(hex: "ffd400")
        self.contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Queue the view to load, then add subviews.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            let halfWidth = (self.contentView.frame.width / 2)
            print(halfWidth)
            
            self.contentView.contentHuggingPriority(for: .horizontal)
            self.contentView.contentHuggingPriority(for: .vertical)
            
            self.contentView.addSubview(self.headerDriverNameLabel)
            self.contentView.addSubview(self.headerDriverNameText)
            
            self.headerDriverNameLabel.widthAnchor.constraint(equalToConstant: halfWidth).isActive = true
            self.headerDriverNameText.widthAnchor.constraint(equalToConstant: halfWidth).isActive = true
            
            self.headerDriverNameLabel.anchorWithConstantsToTop(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 15, bottomConstant: 0, rightConstant: 0)
            self.headerDriverNameText.anchorWithConstantsToTop(top: self.headerDriverNameLabel.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0)
            
            self.contentView.addSubview(self.headerTotalOrdersLabel)
            self.contentView.addSubview(self.headerTotalOrdersText)
            
            self.headerTotalOrdersLabel.widthAnchor.constraint(equalToConstant: halfWidth).isActive = true
            self.headerTotalOrdersText.widthAnchor.constraint(equalToConstant: halfWidth).isActive = true
            
            self.headerTotalOrdersLabel.anchorWithConstantsToTop(top: self.contentView.topAnchor, left: self.headerDriverNameLabel.rightAnchor, bottom: nil, right: self.contentView.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 15)
            self.headerTotalOrdersText.anchorWithConstantsToTop(top: self.headerTotalOrdersLabel.bottomAnchor, left: self.headerDriverNameText.rightAnchor, bottom: nil, right: self.contentView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 15)
            
            self.contentView.addSubview(self.headerTotalCollectedLabel)
            self.contentView.addSubview(self.headerTotalCollectedText)
            
            self.headerTotalCollectedLabel.anchorWithConstantsToTop(top: self.headerDriverNameText.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: self.contentView.rightAnchor, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 10)
            self.headerTotalCollectedText.anchorWithConstantsToTop(top: self.headerTotalCollectedLabel.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: self.contentView.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15)
            
            self.contentView.addSubview(self.ratingImage)
            
            self.ratingImage.widthAnchor.constraint(equalToConstant: 166).isActive = true
            self.ratingImage.anchorWithConstantsToTop(top: self.headerTotalCollectedText.bottomAnchor, left: nil, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 25, rightConstant: 15)
            
            
            self.contentView.addSubview(self.headerOverallSatisfactionLabel)
            self.contentView.addSubview(self.headerOverallSatisfaction)
            
            self.headerOverallSatisfactionLabel.anchorWithConstantsToTop(top: self.headerTotalCollectedText.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 0)
            self.headerOverallSatisfaction.anchorWithConstantsToTop(top: self.headerOverallSatisfactionLabel.bottomAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 20, rightConstant: 0)
        }
        
    }
}
