//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage!
    //var fadeTransition: FadeTransition!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoActionsView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageRatio: CGFloat = image.size.height / image.size.width
        
        imageView.frame = CGRect(x: 0, y: view.center.y / 2, width: view.frame.size.width, height: view.frame.size.width * imageRatio)
        
        imageView.image = image
        
        imageView.center = CGPoint(x: view.center.x, y: view.center.y)
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapPhotoDoneButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let translation = scrollView.contentOffset
        let alpha = convertValue(CGFloat(translation.y), r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0)
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        photoActionsView.alpha = alpha
        doneButton.alpha = alpha
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > 100 || scrollView.contentOffset.y < -100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
