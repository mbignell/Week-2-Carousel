//
//  photoPageViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/27/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class photoPageViewController: UIViewController {

    let progress = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var shareSheet: UIView!
    @IBOutlet weak var overlay: UIView!
    
    @IBOutlet weak var checkBoxComplete: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shareSheet.frame.origin.y = 568
        checkBoxComplete.alpha = 0
        progress.setValue("complete", forKey: "stepOne")
        delay(0.8) {
             UIView.animateWithDuration(0.4, animations: {
                self.checkBoxComplete.alpha = 1
                })
            UIView.animateWithDuration(2, animations: {
                self.checkBoxComplete.alpha = 0
            })
        }
        overlay.alpha = 0
        // Do any additional setup after loading the view.
//        progress.setValue("unseen", forKey: "bannerOne")
//
//
//        if progress.stringForKey("bannerOne"){
//            youDidItBanner.hidden = false
//            progress.setValue("seen", forKey: "bannerOne")
//            print("it got to the if statement")
//            
//        } else {
//            print("got to else")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackButtonPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    

    @IBAction func onShareButtonPress(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: {
            self.shareSheet.frame.origin.y = 160
            self.overlay.alpha = 0.6
        })
        progress.setValue("complete", forKey: "stepThree")
        delay(0.6) {
            self.checkBoxComplete.alpha = 1
            UIView.animateWithDuration(2, animations: {
                self.checkBoxComplete.alpha = 0
            })
        }
    }
    

    @IBAction func onCancelPress(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: {
            self.shareSheet.frame.origin.y = 568
            self.overlay.alpha = 0
        })
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
