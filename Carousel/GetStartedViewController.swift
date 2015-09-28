//
//  GetStartedViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/26/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    let progress = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var checkBoxOne: UIImageView!
    @IBOutlet weak var checkBoxTwo: UIImageView!
    @IBOutlet weak var checkBoxThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progress.setValue("visited", forKey: "seenGoals")

        
        // Do any additional setup after loading the view.
        if let step1 = progress.stringForKey("stepOne"){
            checkBoxOne.highlighted = true
        }else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            print("nope")
        }
        
        if let step2 = progress.stringForKey("stepTwo"){
            checkBoxTwo.highlighted = true
        }else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            print("nope")
        }
        
        if let step3 = progress.stringForKey("stepThree"){
            checkBoxThree.highlighted = true
        }else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            print("nope")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
