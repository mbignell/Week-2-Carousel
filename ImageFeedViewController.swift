//
//  ImageFeedViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/23/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class ImageFeedViewController: UIViewController {

    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var banner: UIButton!
    @IBOutlet weak var scrubber: UIView!
    @IBOutlet weak var scrubberCompleteCheck: UIImageView!
    
    let progress = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedView
            .image!.size
        // Do any additional setup after loading the view.
        scrubberCompleteCheck.alpha = 0
        
        if progress.stringForKey("stepOne") == "complete" && progress.stringForKey("stepTwo") == "complete" && progress.stringForKey("stepThree") == "complete" {
                self.banner.alpha = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onXPress(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.banner.alpha = 0;
            self.xButton.alpha = 0;
        })
    }
    
    @IBAction func onScrubPress(sender: AnyObject) {
        progress.setValue("complete", forKey: "stepTwo")
        delay(0.5) {
                self.scrubberCompleteCheck.alpha = 1
                UIView.animateWithDuration(2, animations: {
                    self.scrubberCompleteCheck.alpha = 0
                })
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
