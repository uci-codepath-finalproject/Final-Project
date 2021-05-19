//
//  SignUpViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/14/21.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreateNewAccount(_ sender: Any) {
        let user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.signUpInBackground(block: { (success, error) in
            if success {
                print("added new user!")
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        })
        
        //TODO : STILL NEED TO SET FIRST / LAST NAME
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
