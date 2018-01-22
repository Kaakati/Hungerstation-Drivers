//
//  DemoData.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class DemoDataModel : Mappable {
    var name : String?
    var username : String?
    var address : AddressModel?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        username <- map["username"]
        address <- map["address"]
    }
}

class AddressModel : Mappable {
    var city : String?
    var street : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        city <- map["city"]
        street <- map["street"]
    }
}
