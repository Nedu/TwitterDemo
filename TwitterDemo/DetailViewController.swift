//
//  DetailViewController.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 2/29/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tweetTime: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favorite: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTweet.text = tweet.text
        tweetTime.text = tweet.timestampString
        profilePicture.setImageWithURL((tweet?.user!.profileUrl)!)
        profileName.text = tweet.user!.name
        profileHandle.text = "@\(tweet.user!.screenname!)"
        retweetLabel.text = "\((tweet.retweetCount))"
        favoriteLabel.text = "\((tweet.favoritesCount))"
        favorite.imageView!.image = UIImage(named: "likeIcon")
        retweet.imageView!.image = UIImage(named: "retweetIcon")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(tweet.id!)
        tweet.retweeted = true
        tweet.retweetCount += 1
        retweetLabel.text = "\((tweet.retweetCount))"
        retweet.enabled = false
    }
    @IBAction func like(sender: AnyObject) {
        TwitterClient.sharedInstance.like(tweet.id!)
        tweet.favorited = true
        tweet.favoritesCount += 1
        favoriteLabel.text = "\((tweet.favoritesCount))"
        favorite.enabled = false
    }
          /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
