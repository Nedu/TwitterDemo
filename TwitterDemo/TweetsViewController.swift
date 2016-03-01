//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 2/21/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import AFNetworking

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tweets: [Tweet]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeLine({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        
            for tweet in tweets {
                print(tweet.text)
            }
            }, failure: { (error:NSError) -> () in
                print(error.localizedDescription)
            })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogOutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        cell.tweet = tweets![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil{
        return tweets!.count
        }
        else
        {
            return 0
        }
    }
        
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let tweet = tweets![indexPath!.row]
        
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.tweet = tweet
        
        print("prepare for segue called")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
