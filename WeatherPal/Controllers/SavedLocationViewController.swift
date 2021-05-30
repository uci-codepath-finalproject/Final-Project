//
//  SavedLocationViewController.swift
//  WeatherPal
//
//  Created by Ethan Wong on 5/30/21.
//

import UIKit
import AlamofireImage
import Parse

class SavedLocationViewController: UIViewController {

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
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegreeLabel: UILabel!
    @IBOutlet weak var windGustLabel: UILabel!
    
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
    @IBOutlet weak var windIcon: UIImageView!
    @IBOutlet weak var windTitle: UILabel!
    @IBOutlet weak var errorIcon: UIImageView!
    @IBOutlet weak var errorText: UILabel!
    
    var forecast: Forecast? = nil
    var cityToken: String = ""
    var searchFromSaved: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideDisplay(data: true)
        errorIcon.isHidden = true
        errorText.isHidden = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        
        if (searchFromSaved != "") {
            performSavedSearch()
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
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
        windSpeedLabel.isHidden = data
        windDegreeLabel.isHidden = data
        windGustLabel.isHidden = data
        
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
        windIcon.isHidden = data
        windTitle.isHidden = data
    }
    
//    func getAPIData() {
//        API.getForecast(city: "London") { (forecast) in
//            guard let forecast = forecast else {
//                print("error ???")
//                return
//            }
//            self.forecast = forecast
//            print("success: weather\(forecast.coord_lon)")
//            for f in forecast.weather{
//                print(f.description, "testing weather")
//            }
//            print(forecast.city)
//            print(forecast.temperature)
//            print(forecast.temperature_feelslike)
//            print(forecast.temperature_min)
//            print(forecast.temperature_max)
//            print(forecast.pressure)
//            print(forecast.humidity)
//            print(forecast.visibility)
//            print(forecast.wind_speed)
//            print(forecast.wind_direction_deg)
//            print(forecast.wind_gust ?? "N/A")
//            print(forecast.cloud_percentage)
//            print(forecast.rain ?? "N/A")
//            print(forecast.snow ?? "N/A")
//        }
//    }
    
    func performSavedSearch() {
        var errorMessage: String = ""
        let text = searchFromSaved
        searchFromSaved = ""
        
        if(text == "") {
            errorMessage = "Please type a city in a text field."
            self.errorText.text = errorMessage
            errorIcon.isHidden = false
            errorText.isHidden = false
        } else if(text != "") {
            API.getForecast(city: text) { (forecast) in
                guard let forecast = forecast else {
                    print("error ???")
                    return
                }
                self.forecast = forecast
                if (forecast.code != 200) {
                    // no results, invalid city
                    //result += "Sorry, invalid city. Try again"
                    self.hideDisplay(data: true)
                    self.errorIcon.isHidden = false
                    errorMessage = "Sorry, '\(text)' is an invalid city. Please try again."
                    self.errorText.text = errorMessage
                    self.errorText.isHidden = false

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
                    self.cityToken = forecast.city
                    self.cityName.text = forecast.city + ", " + forecast.country
                    self.temperatureLabel.text = String(format: "%g", round(forecast.temperature)) + " °C"
                    self.humidityLabel.text = String(forecast.humidity) + " %"
                    self.pressureLabel.text = String(forecast.pressure) + " hPa"
                    self.cloudinessLabel.text = String(forecast.cloud_percentage) + " %"
                    self.rainVolumeLabel.text = String(forecast.rain ?? 0) + " mm"
                    self.snowVolumeLabel.text = String(forecast.snow ?? 0) + " mm"
                    self.windSpeedLabel.text = "Speed: " + String(forecast.wind_speed) + " m/s"
                    self.windDegreeLabel.text = "Direction: " + String(forecast.wind_direction_deg) + " °"
                    self.windGustLabel.text = "Gust: " + String(forecast.wind_gust ?? 0) + " m/s"
                    
                    var iconPath: String = ""
                    for f in forecast.weather{
                        iconPath = "http://openweathermap.org/img/wn/\(f.icon)@2x.png"
                    }
                    let iconURL = URL(string: iconPath) ?? nil
                    self.weatherIcon.af_setImage(withURL: iconURL!)
                    
                    self.hideDisplay(data: false)
                    self.errorIcon.isHidden = true
                    self.errorText.isHidden = true
                }
            }
        }
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
