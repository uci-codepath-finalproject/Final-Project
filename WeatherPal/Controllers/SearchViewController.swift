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
            print("success: longitude is\(forecast.coord_lon)")
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
