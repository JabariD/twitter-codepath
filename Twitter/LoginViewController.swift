//
//  LoginViewController.swift
//  Twitter
//
//  Created by Eva Keeling on 2/13/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "isLoggedIn") == true) {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }

    // This will run when someone taps on the button.
    @IBAction func onLoginButton(_ sender: Any) {
        let authUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: authUrl, success: {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print(Error.localizedDescription)
            print("Could not login!")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
