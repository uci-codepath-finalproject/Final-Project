//
//  SettingViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit
import Parse

class MyLocationViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // hide default text in results
        hideDisplay(data: true)
        
        // get user's saved locations
        let query = PFQuery(className:"Locations")
        query.whereKey("Owner", equalTo: PFUser.current())
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) locations.")
                
                // Display objects
                var counter = 1
                for object in objects {
                    if counter == 1 {
                        self.button1.setTitle(object["City"] as? String, for: .normal)
                        self.button1.isHidden = false
                    } else if counter == 2 {
                        self.button2.setTitle(object["City"] as? String, for: .normal)
                        self.button2.isHidden = false
                    } else if counter == 3 {
                        self.button3.setTitle(object["City"] as? String, for: .normal)
                        self.button3.isHidden = false
                    } else if counter == 4 {
                        self.button4.setTitle(object["City"] as? String, for: .normal)
                        self.button4.isHidden = false
                    } else if counter == 5 {
                        self.button5.setTitle(object["City"] as? String, for: .normal)
                        self.button5.isHidden = false
                    } else {
                        // we only let the user store up to 5 objects
                        break
                    }
                    counter += 1
                }
                
                // hide extra labels if user has < 5 locations saved
                while (counter <= 5) {
                    if counter == 1 {
                        self.button1.isHidden = true
                    } else if counter == 2 {
                        self.button2.isHidden = true
                    } else if counter == 3 {
                        self.button3.isHidden = true
                    } else if counter == 4 {
                        self.button4.isHidden = true
                    } else if counter == 5 {
                        self.button5.isHidden = true
                    }
                    counter += 1
                }
            }
        }
        
    }
    
    func hideDisplay(data: Bool) {
        button1.isHidden = data
        button2.isHidden = data
        button3.isHidden = data
        button4.isHidden = data
        button5.isHidden = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? SavedLocationViewController {
            let button = (sender as! UIButton)
            vc.searchFromSaved = button.title(for: .normal) ?? ""
        }
    }
    
    @IBAction func button1(_ sender: Any) {
        print(button1.title(for: .normal) ?? "")
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
