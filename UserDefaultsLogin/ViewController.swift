//
//  ViewController.swift
//  UserDefaultsLogin
//
//  Created by Hüseyin Kaya on 19.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let username = defaults.string(forKey: "Username") ?? "Empty"
        let password = defaults.string(forKey: "Password") ?? "Empty"
        
        if username != "Empty" && password != "Empty" {
            performSegue(withIdentifier: "segue", sender: nil)
        }
        
    }

    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            
            if username == "admin" && password == "123456" {
                
                defaults.set(username, forKey: "Username")
                defaults.setValue(password, forKey: "Password")
                
                performSegue(withIdentifier: "segue", sender: nil)
                
            } else {
                
                let alertController = UIAlertController(title: "Error", message: "Invalid username or password", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default)
                
                alertController.addAction(okayAction)
                self.present(alertController, animated: true)
            }
            
        }
        
    }
    
}

