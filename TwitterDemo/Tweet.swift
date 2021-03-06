//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 2/20/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var timestamp: NSDate?
    var timestampString: String?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var favorited: Bool?
    var retweeted: Bool?
    var id: String?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        retweeted = dictionary["retweeted"] as? Bool
        favorited = dictionary["favorited"] as? Bool
        
        id = dictionary["id_str"] as? String
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }

    }

    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        
        return tweets
    }
    
    
    
    
    
    
    
    
    
    
    
}
