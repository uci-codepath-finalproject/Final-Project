//
//  ProfileViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/24/21.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    
    let user = PFUser.current()!
    var nameField: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField = ((user["firstName"] as? String)!) + " " + ((user["lastName"] as? String)!)
        name.text = nameField
        email.text = user.username
        // Do any additional setup after loading the view.
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
