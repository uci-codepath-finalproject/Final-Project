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
    var wind_gust: Double?
    var cloud_percentage: Int
    var rain: Double?
    var snow: Double?
    var code: Int
    var city: String
    var country: String
    // deal with rain vs snow
    
    var coords: [String:Any]
    var mains: [String:Any]
    var winds: [String:Any]
    var temps: [Any] // temporary for tracking passed arrays from JSON response
    var sys: [String:Any]
    
//    var mainCategory: String
//    var phone: String
//    var rating: Double
//    var reviews: Int
    
    init(dict: [String:Any]) {
        if (dict["message"] != nil) { // invalid city
            code = 404
            
            coords = [:]
            coord_lon = 0
            coord_lat = 0
            temps = []
            weather = []
            temperature = 0
            temperature_feelslike = 0
            temperature_min = 0
            temperature_max = 0
            pressure = 0
            humidity = 0
            visibility = 0
            wind_speed = 0
            wind_direction_deg = 0
            wind_gust = 0
            cloud_percentage = 0
            rain = 0
            snow = 0
            city = ""
            country = ""
            // deal with rain vs snow
            
            coords = [:]
            mains = [:]
            winds = [:]
            sys = [:]
            
        } else { // only initialize values if we know it was a valid city
            code = 200
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
            wind_gust = winds["gust"] as? Double
            
            cloud_percentage = ((dict["clouds"]) as! [String:Any])["all"] as! Int
            
            if (dict["rain"] != nil) {
                let rains = (dict["rain"]) as! [String:Any]
                if(rains["1h"] != nil) {
                    rain = rains["1h"] as? Double ?? 0
                } else {
                    rain = rains["3h"] as? Double ?? 0
                }
                //rain = ((dict["rain"]) as! [String:Any])["rain.1h"] as? Double
            }
            if (dict["snow"] != nil) {
                let snows = (dict["snow"]) as! [String:Any]
                if(snows["1h"] != nil) {
                    snow = snows["1h"] as? Double ?? 0
                } else {
                    snow = snows["3h"] as? Double ?? 0
                }
                //snow = ((dict["snow"]) as! [String:Any])["snow.1h"] as? Double
            }
            
            city = dict["name"] as! String
            
            sys = (dict["sys"]) as! [String:Any]
            country = sys["country"] as! String
            
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
