//
//  LoginViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/11/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorIcon: UIImageView!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        errorIcon.isHidden = true
        errorMessage.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password, block: { (user, error) in
            if user != nil {
                self.errorIcon.isHidden = true
                self.errorMessage.isHidden = true
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                self.usernameField.resignFirstResponder()
                self.passwordField.resignFirstResponder()
                self.errorIcon.isHidden = false
                self.errorMessage.isHidden = false
                print("Error: \(error?.localizedDescription)")
            }
        })
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "loginToSignUp", sender: self)
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
