//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/26/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var fieldsView: UIView!
    var initialY: CGFloat!
    let offset: CGFloat = -105

    @IBOutlet weak var createDropboxButton: UIButton!
    var createDropboxInitialY: CGFloat!
    let createDropboxOffset: CGFloat = -200

    @IBOutlet weak var checkBox: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        initialY = fieldsView.frame.origin.y
        createDropboxInitialY = createDropboxButton.frame.origin.y
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            self.createDropboxButton.frame.origin = CGPoint(x: self.createDropboxButton.frame.origin.x, y: self.createDropboxInitialY + self.createDropboxOffset)
            //self.signUpUILabel.frame.origin = CGPoint(x: self.signUpUILabel.frame.origin.x, y: self.initialSignUpY + self.signUpOffset)
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
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
            self.createDropboxButton.frame.origin = CGPoint(x: self.createDropboxButton.frame.origin.x, y: self.createDropboxInitialY)
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    
    @IBAction func onCheckBoxPress(sender: AnyObject) {
        if self.checkBox.selected == true {
            self.checkBox.selected = false
        } else {
            self.checkBox.selected = true
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
