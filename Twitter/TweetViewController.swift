//
//  TweetViewController.swift
//  Twitter
//
//  Created by Eva Keeling on 2/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tweetContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetContentTextView.becomeFirstResponder() // display the keyboard!
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitTweet(_ sender: Any) {
        if (!tweetContentTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetContentTextView.text, success: {
                print("Sent tweet!")
                self.dismiss(animated: true, completion: nil)
            }, failure: { Error in
                print("There was an error sending a tweet!")
                print(Error)
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            print("You must put text!")
        }
    }
    @IBAction func cancelTweet(_ sender: Any) {
        // Dismiss this controller
        dismiss(animated: true, completion: nil)
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
