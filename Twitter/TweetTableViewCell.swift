//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Eva Keeling on 2/13/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    
    var tweetID : Int = -1
    var favoriteState : Bool = false
    
    func setFavorite(_ isFavorited:Bool) {
        self.favoriteState = isFavorited
        if (self.favoriteState) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        // want to do the opposite of the current action
        let toBeFavorited = !self.favoriteState
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetID, success: {
                self.setFavorite(true)
                print("Tweet favorited.")
            }, failure: { Error in
                print("Unable to favorite the tweet.")
                print(Error)
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: self.tweetID, success: {
                self.setFavorite(false)
                print("Tweet unfavorited.")
            }, failure: { Error in
                print("Unable to unfavorite the tweet.")
                print(Error)
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: self.tweetID, success: {
            self.setRetweeted(true)
        }, failure: { Error in
            print("Unable to retweet.")
            print(Error)
        })
    }
    
}
