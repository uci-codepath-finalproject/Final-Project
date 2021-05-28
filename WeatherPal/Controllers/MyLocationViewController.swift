//
//  SettingViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit
import Parse

class MyLocationViewController: UIViewController {
    
    @IBOutlet weak var location1: UILabel!
    @IBOutlet weak var location2: UILabel!
    @IBOutlet weak var location3: UILabel!
    @IBOutlet weak var location4: UILabel!
    @IBOutlet weak var location5: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var query = PFQuery(className:"Locations")
//
//        query.getObjectWithId(<#T##objectId: String##String#>)
//            
//            .getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
//          (parseObject: PFObject?, error: NSError?) -> Void in
//          if error == nil && parseObject != nil {
//            print(parseObject)
//          } else {
//            print(error)
//          }
//        }
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
