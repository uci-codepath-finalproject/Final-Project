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
    @IBOutlet weak var errorIcon: UIImageView!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorIcon.isHidden = true
        errorMessage.isHidden = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func onCreateNewAccount(_ sender: Any) {
        let user = PFUser()
        var errorText: String = ""
        user["firstName"] = firstNameField.text
        user["lastName"] = lastNameField.text
        user.username = emailField.text
        user.password = passwordField.text
        if(passwordField.text == confirmPasswordField.text && firstNameField.text != "" && lastNameField.text != "" && emailField.text != "") {
            errorIcon.isHidden = true
            errorMessage.isHidden = true
            user.signUpInBackground(block: { (success, error) in
                if success {
                    print("added new user!")
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("Error: \(error?.localizedDescription)")
                }
            })
        } else if(firstNameField.text == "" || lastNameField.text == "" || emailField.text == "") {
            errorText = "Please fill out all the information."
            errorMessage.text = errorText
            errorIcon.isHidden = false
            errorMessage.isHidden = false
        }
        else if(passwordField.text != confirmPasswordField.text) {
            errorText = "Passwords do not match."
            errorMessage.text = errorText
            errorIcon.isHidden = false
            errorMessage.isHidden = false
        }
        
        //TODO : STILL NEED TO SET FIRST / LAST NAME
    }
    
    
    @IBAction func closeSignUpPage(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
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
