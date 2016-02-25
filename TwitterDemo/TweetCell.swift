//
//  TweetCell.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 2/21/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var tweetTime: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!

    var tweet: Tweet!
        {
        didSet
        {
            
            userTweet.text = tweet.text
            tweetTime.text = tweet.timestampString
            profilePicture.setImageWithURL((tweet?.user!.profileUrl)!)
            profileName.text = tweet.user!.name
            profileHandle.text = "@\(tweet.user!.screenname!)"
            retweetLabel.text = "\((tweet.retweetCount))"
            favoriteLabel.text = "\((tweet.favoritesCount))"
            favoriteButton.imageView!.image = UIImage(named: "likeIcon")
            retweetButton.imageView!.image = UIImage(named: "retweetIcon")
            
            
        }
    }
    @IBAction func favoritePressed(sender: AnyObject) {
        tweet.favorited = true
        tweet.favoritesCount += 1
        favoriteLabel.text = "\((tweet.favoritesCount))"
        favoriteButton.enabled = false
    }
    
    @IBAction func retweetPressed(sender: AnyObject) {
        tweet.retweeted = true
        tweet.retweetCount += 1
        retweetLabel.text = "\((tweet.retweetCount))"
        retweetButton.enabled = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePicture.layer.cornerRadius = 3
        profilePicture.clipsToBounds = true
        userTweet.preferredMaxLayoutWidth = userTweet.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userTweet.preferredMaxLayoutWidth = userTweet.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
