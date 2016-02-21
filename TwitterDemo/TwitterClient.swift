//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 2/20/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "6uM8Vepyrntye0Clx5jy5xdX2", consumerSecret: "aMd0w3MvVISohoG7I0YG2whZIUFm1ldhr20QcsQ42NUYzfEgvb")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((NSError) -> ())?
    
    
    func login(success: ()->(), failure: (NSError)->()) {
        loginSuccess = success
        loginFailure = failure
        
        
        TwitterClient.sharedInstance.deauthorize()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            
            }) { (error: NSError!) -> Void in
                print("error: \(error.localizedDescription)")
                self.loginFailure?(error)
        }
    }
    
    func handleOpenUrl(url: NSURL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessTokenWithPath("oauth/access_token", method: "POST",
            requestToken: requestToken, success: { (accessToken:
                BDBOAuth1Credential!) -> Void in
                
                self.loginSuccess?()
                
                
            }) { (error: NSError!) -> Void in
                print("error: \(error.localizedDescription)")
                self.loginFailure?(error)
        }

    }
    
    func homeTimeLine(success: ([Tweet]) -> (), failure: (NSError) -> ()) {
        
        GET("1.1/statuses/home_timeline.json", parameters: nil,
            progress: nil, success: { (task: NSURLSessionDataTask, response:
                AnyObject?) -> Void in
                let dictionaries = response as! [NSDictionary]
                let tweets = Tweet.tweetsWithArray(dictionaries)
                
                success(tweets)
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })
    }
    
    func currentAccount() {
        GET("1.1/account/verify_credentials.json", parameters: nil,
            progress: nil, success: {(task: NSURLSessionDataTask, response:
                AnyObject?) -> Void in
                let userDictionary = response as! NSDictionary
                //print("user: \(user)")
                
                let user = User(dictionary: userDictionary)
                
                print("name: \(user.name)")
                print("screenname: \(user.screenname)")
                print("profile url: \(user.profileUrl)")
                print("description: \(user.tagline)")
                
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
        })
        
    }
    
    










}
