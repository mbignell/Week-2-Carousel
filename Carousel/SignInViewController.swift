//
//  SignInViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/26/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var animateViewIn: UIView!
    var animateViewInitialScale = 1
    var animateViewInitialY: CGFloat!

    
    @IBOutlet weak var fieldsView: UIView!
    var initialY: CGFloat!
    let offset: CGFloat = -80
    
    
    @IBOutlet weak var signInButtons: UIView!
    var signInInitialY: CGFloat!
    let signInOffset: CGFloat = -220
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let blankFieldAlertController = UIAlertController(title: "Blank Field", message: "Fill in all the fields, yo.", preferredStyle: .Alert)
    let incorrectLoginAlertController = UIAlertController(title: "Incorrect Email/Password", message: "is this really your account", preferredStyle: .Alert)

    let loadingAlertController = UIAlertController(title: "Signing in...", message: "", preferredStyle: .Alert)
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldsView.frame.origin.y
        signInInitialY = signInButtons.frame.origin.y

        animateViewInitialY = animateViewIn.frame.origin.y
        animateViewIn.alpha = 0
        animateViewIn.transform = CGAffineTransformMakeScale(0.8, 0.8)

        
         animateViewIn.frame.origin = CGPoint(x: self.animateViewIn.frame.origin.x, y: -40)
         UIView.animateWithDuration(0.6, animations: {
            self.animateViewIn.frame.origin = CGPoint(x: self.animateViewIn.frame.origin.x, y:self.animateViewIn.frame.origin.y + 90)
            self.animateViewIn.alpha = 1
            self.animateViewIn.transform = CGAffineTransformMakeScale(1, 1)
            })
        
        
        // Do any additional setup after loading the view.
        // add the OK action to the alert controller
        blankFieldAlertController.addAction(OKAction)
        incorrectLoginAlertController.addAction(OKAction)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let _kbsize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            self.fieldsView.frame.origin = CGPoint(x: self.fieldsView.frame.origin.x, y: self.initialY + self.offset)
             self.signInButtons.frame.origin = CGPoint(x: self.signInButtons.frame.origin.x, y: self.signInInitialY + self.signInOffset)
            //self.signUpUILabel.frame.origin = CGPoint(x: self.signUpUILabel.frame.origin.x, y: self.initialSignUpY + self.signUpOffset)
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
  
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        emailField.endEditing(true)
        passwordField.endEditing(true)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let _kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.fieldsView.frame.origin = CGPoint(x: self.fieldsView.frame.origin.x, y: self.initialY)
            self.signInButtons.frame.origin = CGPoint(x: self.signInButtons.frame.origin.x, y: self.signInInitialY)
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }

    @IBAction func onSignInTap(sender: AnyObject) {
        if emailField.text == "" || passwordField.text == "" {
            //One of the fields is empty
            presentViewController(loadingAlertController, animated: true) {}
            delay(2) {
                self.loadingAlertController.dismissViewControllerAnimated(true, completion: nil)
                self.presentViewController(self.blankFieldAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                }
            }
        } else if emailField.text != "email@email.com" && passwordField.text != "password" {
           //Username or password is incorrect
            presentViewController(loadingAlertController, animated: true) {}
            delay(2) {
                self.loadingAlertController.dismissViewControllerAnimated(true, completion: nil)
                self.presentViewController(self.incorrectLoginAlertController, animated: true) {}
            }
        } else {
            //They have the correct log in credentials
            presentViewController(loadingAlertController, animated: true) {}
            delay(2) {
                print("correct")
                self.loadingAlertController.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("signInSegue", sender: self)
            }
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
