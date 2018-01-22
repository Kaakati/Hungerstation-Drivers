//
//  OrdersModel.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper


class OrdersModel : Mappable {
    var orderNumber : Int?
    var orderDate : Date?
    var orderPickupLocation : [PickupLocationModel]?
    var orderDeliveryLocation : [DeliveryLocationModel]?
    var orderOwnerMobile : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        orderNumber <- map["mobileNumber"]
        orderDate <- map["orderDate"]
        orderPickupLocation <- map["orderPickupLocation"]
        orderDeliveryLocation <- map["orderDeliveryLocation"]
        orderOwnerMobile <- map["orderOwnerMobile"]
    }
}



class PickupLocationModel : Mappable {
    var lat : String?
    var long : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
    }
}



class DeliveryLocationModel : Mappable {
    var lat : String?
    var long : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
    }
}
