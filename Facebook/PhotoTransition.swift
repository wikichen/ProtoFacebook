//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let imageViewCopy = UIImageView()
        imageViewCopy.frame = containerView.convertRect(feedViewController.tappedPhoto.frame, fromView: feedViewController.tappedPhoto.superview)
        imageViewCopy.image = feedViewController.tappedPhoto.image
        
        feedViewController.tappedPhoto.hidden = true
        containerView.addSubview(imageViewCopy)
        
        toViewController.view.alpha = 0
        photoViewController.imageView.hidden = true

        UIView.animateWithDuration(0.2, animations: {
            toViewController.view.alpha = 1
            imageViewCopy.frame = photoViewController.imageView.frame
        }) { (finished: Bool) -> Void in
            UIView.animateWithDuration(0.2, animations: {
                photoViewController.imageView.hidden = false
                feedViewController.tappedPhoto.hidden = true
                imageViewCopy.removeFromSuperview()
                self.finish()
            })
        }
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController

        
        let imageViewCopy = UIImageView()
        imageViewCopy.frame = containerView.convertRect(photoViewController.imageView.frame, fromView: photoViewController.imageView.superview)
        imageViewCopy.image = photoViewController.imageView.image
        imageViewCopy.contentMode = photoViewController.imageView.contentMode
        
        photoViewController.imageView.hidden = true
        feedViewController.tappedPhoto.hidden = true
        containerView.addSubview(imageViewCopy)
        
        toViewController.view.alpha = 1
        
        UIView.animateWithDuration(0.2, animations: {
            fromViewController.view.alpha = 0
            imageViewCopy.frame = feedViewController.tappedPhoto.frame
            
        }) { (finished: Bool) -> Void in
            UIView.animateWithDuration(0.2, animations: {
                feedViewController.tappedPhoto.hidden = false
                imageViewCopy.removeFromSuperview()
                self.finish()
            })
        }
        
    }
}
