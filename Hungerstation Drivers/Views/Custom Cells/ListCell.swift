//
//  ListCell.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    let personName : UILabel = {
        let lbl = UILabel()
        lbl.text = "User Name"
        lbl.font = Singleton.shared.HungerstationBoldFont
        return lbl
    }()
    
    let streetName : UILabel = {
        let lbl = UILabel()
        lbl.text = "Street Name"
        lbl.font = Singleton.shared.HungerstationLightFont
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        setupViews()
    }

    
    func setupViews() {
        contentView.addSubview(personName)
        contentView.addSubview(streetName)
        
        personName.anchorWithConstantsToTop(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10)
        streetName.anchorWithConstantsToTop(top: personName.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 10, rightConstant: 10)
        
    }
}
