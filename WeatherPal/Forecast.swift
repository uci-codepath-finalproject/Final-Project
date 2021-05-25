//
//  Forecast.swift
//  WeatherPal
//
//  Created by Ethan Wong on 5/18/21.
//

import Foundation

/* store stuff from API into a Restaurant object to make stuff easier and
    track an arra of them */

class Forecast {
//    var imageURL : URL?
//    var url: URL?
    var coord_lon: Double
    var coord_lat: Double
    var weather = [WeatherDescription]()
    var temperature: Double
    var temperature_feelslike: Double
    var temperature_min: Double
    var temperature_max: Double
    var pressure: Int
    var humidity: Int
    var visibility: Int
    var wind_speed: Double
    var wind_direction_deg: Int
    var wind_gust: Double
    var cloud_percentage: Int
    var rain: Double?
    var snow: Double?
    
    // deal with rain vs snow
    
    var coords: [String:Any]
    var mains: [String:Any]
    var winds: [String:Any]
    var temps: [Any] // temporary for tracking passed arrays from JSON response
    
//    var mainCategory: String
//    var phone: String
//    var rating: Double
//    var reviews: Int
    
    init(dict: [String:Any]) {
        //TODO : ACCOUNT IF THERE ARE NO RESULTS
        coords = (dict["coord"]) as! [String:Any]
        coord_lon = coords["lon"] as! Double
        coord_lat = coords["lat"] as! Double
        
        temps = (dict["weather"]) as! [Any]
        for temp in temps {
            self.weather.append(WeatherDescription.init(dict: temp as! [String : Any]))
            
        }
        
        mains = (dict["main"]) as! [String:Any]
        temperature = (mains["temp"] as! Double) - 273
        temperature_feelslike = (mains["feels_like"] as! Double) - 273
        temperature_min = (mains["temp_min"] as! Double) - 273
        temperature_max = (mains["temp_max"] as! Double) - 273
        pressure = mains["pressure"] as! Int
        humidity = mains["humidity"] as! Int
        
        visibility = (dict["visibility"]) as! Int
        
        winds = (dict["wind"]) as! [String:Any]
        wind_speed = winds["speed"] as! Double
        wind_direction_deg = winds["deg"] as! Int
        wind_gust = winds["gust"] as! Double
        
        cloud_percentage = ((dict["clouds"]) as! [String:Any])["all"] as! Int
        
        if (dict["rain"] != nil) {
            rain = ((dict["rain"]) as! [String:Any])["rain.1h"] as? Double
        }
        if (dict["snow"] != nil) {
            snow = ((dict["snow"]) as! [String:Any])["snow.1h"] as? Double
        }
    }
    
    static func tostring() {
//        print(coord_lon, coord_lat, weather)
        
    }
    
//    static func getMainCategory(dict: [String:Any]) -> String {
//        let categories = dict["categories"] as! [[String:Any]]
//        return categories[0]["title"] as! String
//    }
}
