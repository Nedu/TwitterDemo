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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
