//
//  ReplyViewController.swift
//  TwitterDemo
//
//  Created by Chinedum Robert-Maduekwe on 3/2/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    var id: String?
    var username: String?

    @IBOutlet weak var replyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replyTextView.text = "@" + username!

        // Do any additional setup after loading the view.
    }

    @IBAction func onReply(sender: AnyObject) {
        TwitterClient.sharedInstance.reply(self.replyTextView.text!, id: self.id!)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
