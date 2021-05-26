//
//  SearchViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit
import AlamofireImage

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tempResults: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cloudinessLabel: UILabel!
    @IBOutlet weak var rainVolumeLabel: UILabel!
    @IBOutlet weak var snowVolumeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var humidityIcon: UIImageView!
    @IBOutlet weak var humidityTitle: UILabel!
    @IBOutlet weak var pressureIcon: UIImageView!
    @IBOutlet weak var pressureTitle: UILabel!
    @IBOutlet weak var cloudIcon: UIImageView!
    @IBOutlet weak var cloudTitle: UILabel!
    @IBOutlet weak var rainIcon: UIImageView!
    @IBOutlet weak var rainTitle: UILabel!
    @IBOutlet weak var snowIcon: UIImageView!
    @IBOutlet weak var snowTitle: UILabel!
    
    var forecast: Forecast? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideDisplay(data: true)
        // Do any additional setup after loading the view.
    }
    
    func hideDisplay(data: Bool) {
        cityName.isHidden = data
        temperatureLabel.isHidden = data
        humidityLabel.isHidden = data
        weatherIcon.isHidden = data
        pressureLabel.isHidden = data
        cloudinessLabel.isHidden = data
        rainVolumeLabel.isHidden = data
        snowVolumeLabel.isHidden = data
        descriptionLabel.isHidden = data
        timeLabel.isHidden = data
        
        locationTitle.isHidden = data
        humidityIcon.isHidden = data
        humidityTitle.isHidden = data
        pressureIcon.isHidden = data
        pressureTitle.isHidden = data
        cloudIcon.isHidden = data
        cloudTitle.isHidden = data
        rainIcon.isHidden = data
        rainTitle.isHidden = data
        snowIcon.isHidden = data
        snowTitle.isHidden = data
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
            print(forecast.city)
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
                self.hideDisplay(data: true)
            } else {
                
                let now = Date()

                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.timeStyle = .long

                let datetime = formatter.string(from: now)
                self.timeLabel.text = datetime
                
                var description: String = ""
                for d in forecast.weather {
                    description = "\(d.description). High \(String(format: "%g", round(forecast.temperature_max))) °C. Low \(String(format: "%g", round(forecast.temperature_min))) °C."
                }

                self.descriptionLabel.text = description
                self.cityName.text = forecast.city + ", " + forecast.country
                self.temperatureLabel.text = String(format: "%g", round(forecast.temperature)) + " °C"
                self.humidityLabel.text = String(forecast.humidity) + " %"
                self.pressureLabel.text = String(forecast.pressure) + " hPa"
                self.cloudinessLabel.text = String(forecast.cloud_percentage) + " %"
                self.rainVolumeLabel.text = String(forecast.rain ?? 0) + " mm"
                self.snowVolumeLabel.text = String(forecast.snow ?? 0) + " mm"
                
                var iconPath: String = ""
                for f in forecast.weather{
                    iconPath = "http://openweathermap.org/img/wn/\(f.icon)@2x.png"
                }
                let iconURL = URL(string: iconPath) ?? nil
                self.weatherIcon.af_setImage(withURL: iconURL!)
                self.hideDisplay(data: false)
                result += "longitude: \(forecast.coord_lon)\n"
                result += "latitude: \(forecast.coord_lat)\n"
                for f in forecast.weather{
                    result += "overview: \(f.description)\n"
                }
                result += "city: \(forecast.city)\n"
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
