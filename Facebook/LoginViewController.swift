//
//  LoginViewController.swift
//  Facebook
//
//  Created by Jonathan Chen on 5/26/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fbLogoImageView: UIImageView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    // define variables for initial y and offset
    var labelSuperviewInitialY: CGFloat!
    var labelSuperviewOffset: CGFloat!
    var fieldSuperviewInitialY: CGFloat!
    var fieldSuperviewOffset: CGFloat!
    var fbLogoImageViewInitialY: CGFloat!
    var fbLogoImageOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSuperviewInitialY = labelSuperview.frame.origin.y
        labelSuperviewOffset = -250
        fieldSuperviewInitialY = fieldSuperview.frame.origin.y
        fieldSuperviewOffset = -50
        fbLogoImageViewInitialY = fbLogoImageView.frame.origin.y
        fbLogoImageOffset = -20
        
        loginButton.enabled = false

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        labelSuperview.frame.origin.y = labelSuperviewInitialY + labelSuperviewOffset
        fieldSuperview.frame.origin.y = fieldSuperviewInitialY + fieldSuperviewOffset
        fbLogoImageView.frame.origin.y = fbLogoImageViewInitialY + fbLogoImageOffset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        labelSuperview.frame.origin.y = labelSuperviewInitialY
        fieldSuperview.frame.origin.y = fieldSuperviewInitialY
        fbLogoImageView.frame.origin.y = fbLogoImageViewInitialY
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        // Start animating the activity indicator
        loginIndicator.startAnimating()
        // Set the Button state to "Selected"
        loginButton.selected = true
        
        if emailField.text == "user@example.com" && passwordField.text == "password" {
            
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("tabBarSegue", sender: nil)
            })
        } else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                // instantiate error alert controller
                let alertController = UIAlertController(title: "Access Denied", message: "Wrong username or password", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                    // do nothing
                }
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true) {
                    // nothing
                }
                
            })
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
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
