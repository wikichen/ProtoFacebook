//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var newsFeedScrollView: UIScrollView!
    @IBOutlet weak var newsFeedImageView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(animated: Bool) {
        newsFeedImageView.hidden = true
        loadingIndicator.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(2) { () -> () in
            self.newsFeedImageView.hidden = false
            self.loadingIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newsFeedScrollView.contentSize = CGSize(width: 320, height: 1125)
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
