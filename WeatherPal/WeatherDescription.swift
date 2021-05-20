//
//  WeatherDescription.swift
//  WeatherPal
//
//  Created by Ethan Wong on 5/18/21.
//

import Foundation

/* store stuff from API into a Restaurant object to make stuff easier and
    track an arra of them */

class WeatherDescription {
//    var imageURL : URL?
//    var url: URL?
    var id: Int
    var icon: String
    var main: String
    var description: String
    
//    var mainCategory: String
//    var phone: String
//    var rating: Double
//    var reviews: Int
    
    init(dict: [String:Any]) {
//        coords = (dict["coord"]) as! [String:Any]
//        coord_lon = coords["lon"] as! Double
//        coord_lat = coords["lat"] as! Double
        id = dict["id"] as! Int
        icon = dict["icon"] as! String
        main = dict["main"] as! String
        description = dict["description"] as! String
//        name = dict["name"] as! String
//        rating = dict["rating"] as! Double
//        reviews = dict["review_count"] as! Int
//        phone = dict["display_phone"] as! String
//        url = URL(string: dict["url"] as! String)
//        // my note --> dict : dict shows that the argument label dict corresponds to the dict object
//        mainCategory = Restaurant.getMainCategory(dict: dict)
    }
    
//    static func getMainCategory(dict: [String:Any]) -> String {
//        let categories = dict["categories"] as! [[String:Any]]
//        return categories[0]["title"] as! String
//    }
}
