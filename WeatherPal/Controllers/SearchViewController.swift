//
//  SearchViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tempResults: UILabel!
    
    var forecast: Forecast? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getAPIData() {
        API.getForecast(city: "London") { (forecast) in
            guard let forecast = forecast else {
                print("error ???")
                return
            }
            self.forecast = forecast
            print("success: weather\(forecast.coord_lon)")
            for f in forecast.weather{
                print(f.description, "testing weather")
            }
            print(forecast.temperature)
            print(forecast.temperature_feelslike)
            print(forecast.temperature_min)
            print(forecast.temperature_max)
            print(forecast.pressure)
            print(forecast.humidity)
            print(forecast.visibility)
            print(forecast.wind_speed)
            print(forecast.wind_direction_deg)
            print(forecast.wind_gust)
            print(forecast.cloud_percentage)
            print(forecast.rain ?? "N/A")
            print(forecast.snow ?? "N/A")
        }
    }
    
    @IBAction func performSearch(_ sender: Any) {
        let text = (searchBar.text ?? "")
        var result = String()
        API.getForecast(city: text) { (forecast) in
            guard let forecast = forecast else {
                print("error ???")
                return
            }
            self.forecast = forecast
            if (forecast.code != 200) {
                // no results, invalid city
                result += "Sorry, invalid city.  Try again"
            } else {
                result += "longitude: \(forecast.coord_lon)\n"
                result += "latitude: \(forecast.coord_lat)\n"
                for f in forecast.weather{
                    result += "overview: \(f.description)\n"
                }
                result += "temperature  (C): \(forecast.temperature)\n"
                result += "feels like   (C): \(forecast.temperature_feelslike)\n"
                result += "min temp     (C): \(forecast.temperature_min)\n"
                result += "max temp     (C): \(forecast.temperature_max)\n"
                result += "pressure   (hPa): \(forecast.pressure)\n"
                result += "humidity     (%): \(forecast.humidity)\n"
                result += "visibility   (m): \(forecast.visibility)\n"
                result += "wind speed (m/s): \(forecast.wind_speed)\n"
                result += "direction  (deg): \(forecast.wind_direction_deg)\n"
                result += "wind gust  (m/s): \(forecast.wind_gust)\n"
                result += "cloud %      (%): \(forecast.cloud_percentage)\n"
                result += "rain        (mm): \(forecast.rain ?? 0)\n"
                result += "snow        (mm): \(forecast.snow ?? 0)\n"
                print("results: \(result)")
            }
            self.tempResults.text = result
        }
    }
    
    @IBAction func testAPI(_ sender: Any) {
        getAPIData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
