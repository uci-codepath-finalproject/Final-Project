//
//  ProfileViewController.swift
//  WeatherPal
//
//  Created by Hao-Ming Chiang on 5/24/21.
//

import UIKit
import Parse
import Lottie

class ProfileViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    
    let user = PFUser.current()!
    var nameField: String = ""
    
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "loading")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 3
        view.addSubview(animationView!)
        animationView!.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animationView!.stop()
            self.view.subviews.last?.removeFromSuperview()
        }
        
        let first_name = user["firstName"] ?? ""
        let last_name = user["lastName"] ?? ""
        name.text = "\(first_name) \(last_name)"
        
//        nameField = ((user["firstName"] as? String)!) + " " + ((user["lastName"] as? String)!)
//        name.text = nameField
        email.text = user.username
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
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
