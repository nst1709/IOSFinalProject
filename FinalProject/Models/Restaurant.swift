//
//  Restaurant.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import CoreLocation
import Foundation
import MapKit

class Restaurant: NSObject, MKAnnotation {
    
    var name : String = ""
    var address : String = ""
    var cuisine : String = ""
    var rating : String = ""
    
    var cost : String = ""
    var menu : String = ""
    var photos : String = ""
    var url : String = ""
    
    var location : CLLocation?
    
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }

    
    override var description: String{
        return "{ \n\t Name: \(name) \n\t Address: \(address) \n\t Location: \(String(describing: location))}"
    }
    
    
    init(name: String, address: String, rating: String, cuisine: String, cost: String, menu: String, photos: String, url: String, location: CLLocation?){
        self.name = name
        self.address = address
        self.location = location
        self.cuisine = cuisine
        self.rating = rating
        self.cost = cost
        self.menu = menu
        self.photos = rating
        self.url = url
    }
    
    convenience override init () {
        self.init(name: "Unknown", address: "Unknown", rating:"Unknown", cuisine:"Unknown", cost: "Unknown", menu:"Unknown", photos:"Unknown", url: "Unknown", location: nil )
    }
    
    var title : String? {
        get {
            return name
        }
    }
    
    var subtitle : String? {
        get {
            return address
        }
    }
 
}


