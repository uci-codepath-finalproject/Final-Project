//
//  API.swift
//  WeatherPal
//
//  Created by Ethan Wong on 5/18/21.
//

import Foundation


struct API {
    
    static func getForecast(completion: @escaping (Forecast?) -> Void) {
        
        let apikey = "d7ca5662b88d1d4ed0983b62c5a8847c"
        
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London&appid=\(apikey)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
        
                /* older code */
                /*
                // ––––– TODO: Get data from API and return it using completion
                
                // 1. Convert json response to a dictionary
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // 2. Grab the businesses data and convert it to an array of dictionaries
                //    for each restaurant
                let restaurants = dataDictionary["businesses"] as! [[String: Any]]
                // 3. completion is an escaping method  which allows the data to be used
                //    outside of the closure
                return completion(restaurants)
                */
                
                
                /* newer code to use Forecast objects */
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                let forecast = Forecast.init(dict: dataDictionary)
                return completion(forecast)
                /*
                // Get array of restaurant dictionaries
                let restDictionaries = dataDictionary["businesses"] as! [[String: Any]]
                
                // Variable to store array of restaurants
                var forecasts: [Forecast] = []
                
                // Use each restaurant dictionary to initialize Restauraunt object
                for dictionary in restDictionaries {
                    let restaurant = Restaurant.init(dict: dictionary)
                    restaurants.append(restaurant)
                }
                
                return completion(restaurants) */
                }
            }
        
            task.resume()
        
        }
    }

    
