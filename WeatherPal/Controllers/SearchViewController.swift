//
//  SearchViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    var forecast: Forecast? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getAPIData() {
        API.getForecast() { (forecast) in
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
