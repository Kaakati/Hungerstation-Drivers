//
//  UserModel.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper


class UserModel : Mappable {
    var mobileNumber : String?
    var password : String?
    var token : UserTokenModel?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        mobileNumber <- map["mobileNumber"]
        password <- map["password"]
    }
}

class UserTokenModel : Mappable {
    var token : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
}
