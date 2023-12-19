//
//  MainPageViewController.swift
//  UserDefaultsLogin
//
//  Created by Hüseyin Kaya on 19.12.2023.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        let username = defaults.string(forKey: "Username") ?? "Empty"
        
        defaults.set(username, forKey: "Username")
        
        label.text = username
        
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
        defaults.removeObject(forKey: "Username")
        defaults.removeObject(forKey: "Password")
        
        exit(-1)
    }
    
}
