//
//  FeedViewController.swift
//  ProtoFacebook
//
//  Created by Jonathan Chen on 6/16/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var tappedPhoto: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPhotoTap(sender: UITapGestureRecognizer) {
        
        print("tapped")
        tappedPhoto = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.tappedPhoto.image
        
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
